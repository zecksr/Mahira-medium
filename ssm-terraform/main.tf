# Create IAM Instance Profile
resource "aws_iam_role" "instance_profile" {
   name = var.role_name
   assume_role_policy = jsonencode({
   Version = "2012–10–17"
   Statement = [
     {
   Action = "sts:AssumeRole"
   Effect = "Allow"
   Principal = {
   Service = "ec2.amazonaws.com"
           }
        }
      ]
   })
}
resource "aws_iam_role_policy_attachment" "instance_profile_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore" # Use "AmazonSSMFullAccess" for full Systems Manager permissions
  role = aws_iam_role.instance_profile.name
}

# Replace "YOUR_INSTANCE_ID" with your EC2 instance ID
resource "aws_instance" "example" {
  ami = var.ami_id
  instance_type = "t2.micro" # Replace with your desired instance type
  iam_instance_profile = aws_iam_role.instance_profile.name
tags = {
    Name = "SSM Instance"
   }
}