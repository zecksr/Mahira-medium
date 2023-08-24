#                                          How to Create an IAM Role with EC2&S3 Full Permissions Using Terraform
This repository contains Terraform code to create an AWS Identity and Access Management (IAM) role with EC2 full permissions. With this IAM role, EC2 instances can be launched with elevated privileges to interact with other AWS services securely.

## Prerequisites
Before you begin, ensure you have the following:

AWS account and IAM user credentials.
Terraform installed on your local machine. You can download Terraform from the official website.

## Steps to Create IAM Role

Clone this repository to your local machine:
git clone https://github.com/MahiraTechnology/Mahira-medium.git

Navigate to the repository's directory:
cd iam-ec2

Open the main.tf file and review the IAM role configuration. Modify the permissions, trust relationships, and role name as needed.
Initialize Terraform in the repository's directory:

terraform init

Preview the changes that will be applied:

terraform plan

Apply the changes to create the IAM role:

terraform apply

You will be prompted to confirm the changes. Type yes and press Enter.

Terraform will create the IAM role and provide you with an output that includes the role ARN. Make note of this ARN as you will need it when launching EC2 instances.

Using the IAM Role
To use the IAM role you've created:

Launch an EC2 instance and associate the IAM role with it.

The EC2 instance will have the permissions defined in the IAM role. You can use AWS SDKs, CLI, or SDKs to interact with AWS services using the instance's role-based credentials.

## Cleaning Up
To avoid incurring charges, don't forget to destroy the resources when you're done:

Run the following command to destroy the resources created by Terraform:
terraform destroy

Confirm the destruction by typing yes when prompted.

