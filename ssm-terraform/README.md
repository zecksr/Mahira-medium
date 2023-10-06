#                                       Enabling Session Manager on an EC2 Instance Using Terraform
This repository provides Terraform configuration to enable AWS Systems Manager Session Manager on an EC2 instance. Session Manager allows you to establish secure, encrypted sessions to your EC2 instances without the need for SSH or RDP access. It's a powerful tool for managing and troubleshooting instances in a secure and auditable manner.

## Prerequisites
Before you begin, make sure you have the following prerequisites:
AWS CLI: Ensure that you have the AWS CLI installed and configured with the necessary permissions.
Terraform: Install Terraform on your local machine. You can download it from the Terraform website.

## Usage
Clone the Repository:
git clone https://github.com/MahiraTechnology/Mahira-medium.git
cd ssm-terraform

Initialize Terraform:
Run the following command to initialize the Terraform workspace:
terraform init
Modify the Configuration:

Open the main.tf file and update the following variables:

instance_id: Set this to the ID of the EC2 instance you want to enable Session Manager on.
iam_role_name: Provide the IAM role name that allows Session Manager access.
Apply the Configuration:

Run the following command to apply the Terraform configuration:
terraform apply
Terraform will prompt you to confirm the changes. Enter yes to proceed.

Testing Session Manager:
Once the Terraform apply is complete, you can test Session Manager by using the AWS Systems Manager console or AWS CLI.

## Clean Up
To disable Session Manager on the EC2 instance and remove the associated resources, run:
terraform destroy

## Security
Ensure that you follow security best practices when managing instances with Session Manager. Limit access to the necessary IAM roles and accounts and regularly review and audit session logs.

