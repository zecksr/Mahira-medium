resource "aws_instance" "ec2_s3" {
  ami                  = var.ami-id
  instance_type        = var.instance-type

  tags = {
    Name = "circleci-ec2"
  }
}