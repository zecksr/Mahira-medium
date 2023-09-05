resource "random_password" "db_master_password" {
  length  = 16
  special = false
}

resource "random_password" "db_read_only_password" {
  length  = 16
  special = false
}

resource "aws_secretsmanager_secret" "postgres_db" {
  name = var.secret_name
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "postgres_db" {
  secret_id     = aws_secretsmanager_secret.postgres_db.id
  secret_string = <<EOT
{
  "master_username": "${var.db_username}",
  "master_password": "${random_password.db_master_password.result}",
  "read_only_username": "${var.db_username}_db",
  "read_only_password": "${random_password.db_read_only_password.result}",
}
EOT
}

resource "aws_vpc" "default" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.vpc_name}"
  }
}

resource "aws_subnet" "public_subnet" {
  count                   = var.count_index
  vpc_id                  = aws_vpc.default.id
  cidr_block              = var.public_subnet_cidr_blocks[count.index]
  availability_zone       = var.azs[count.index]
  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "db_subnet" {
  count             = var.count_index
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.db_subnets_cidr_blocks[count.index]
  availability_zone = var.azs[count.index]  # Replace with your desired availability zone
  tags = {
    Name = "Database Subnets"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "postgres IGW"
  }
}

# Create Web layber route table
resource "aws_route_table" "web-rt" {
  vpc_id = aws_vpc.default.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "WebRT"
  }
}

resource "aws_security_group" "allow_all" {
  name   = "postgres_rds-sg"
  vpc_id = aws_vpc.default.id
  description = "RDS instance security group"
  ingress {
    description = "All Traffic"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [var.public_subnet_cidr_blocks[0],
    var.public_subnet_cidr_blocks[1],
    var.public_subnet_cidr_blocks[2],
    var.db_subnets_cidr_blocks[0],
    var.db_subnets_cidr_blocks[1],
    var.db_subnets_cidr_blocks[2]]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = "allow_all"
  }
}
resource "aws_db_instance" "postgres_rds" {
  allocated_storage    = var.allocated_storage
  identifier           = var.identifier
  storage_type         = var.storage_type
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.db_username
  password             = random_password.db_read_only_password.result
  parameter_group_name = var.parameter_group_name
  db_subnet_group_name = aws_db_subnet_group.db-subnet.name
  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "db-subnet" {
  name = var.db_subnet_group_name
  subnet_ids  = [
   aws_subnet.db_subnet[0].id,
   aws_subnet.db_subnet[1].id,
   aws_subnet.db_subnet[2].id
  ]
}

data "http" "my_ip" {
  url = "http://checkip.amazonaws.com/"
}

resource "aws_iam_role" "bastion_role" {
  name               = "bastion-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_security_group" "sg-bastion-host" {
  name        = "sg_for_bastion-host"
  description = "security group for bastion host"
  vpc_id      = aws_vpc.default.id

ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.my_ip.body)}/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name          = "sg_for_bastion"

  }
}
resource "aws_iam_instance_profile" "iam_profile" {
  name = "bastion-profile"
  role = aws_iam_role.bastion_role.name
}

resource "aws_instance" "bastion_host" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg-bastion-host.id]
  key_name               = aws_key_pair.bastion-key.key_name
  iam_instance_profile    = aws_iam_instance_profile.iam_profile.id
  subnet_id               = aws_subnet.public_subnet[0].id 
  tags = {
    Name = "bastion-host"
  }
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
}

resource "aws_key_pair" "bastion-key" {
  key_name   = var.key_name
  public_key = tls_private_key.this.public_key_openssh

  provisioner "local-exec" { # Create a "myKey.pem" to your computer!!
    command = "echo '${tls_private_key.this.private_key_pem}' > ~/${var.key_name}.pem"
  }

}