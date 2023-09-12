#                                                       creating IAM User and Group with Password change policy using Terraform

## Overview
This Terraform script allows you to automate the creation of an AWS IAM User and Group with a password change policy. IAM (Identity and Access Management) allows you to manage access to AWS services and resources securely. By using this Terraform script, you can ensure consistent user and group provisioning while enforcing best practices for password management.

## Prerequisites
Before you begin, ensure you have
Terraform installed on your local machine.
AWS credentials properly configured. You can configure your AWS credentials using the AWS CLI or environment variables.

## Usage
Clone this repository to your local machine:
git clone https://github.com/MahiraTechnology/Mahira-medium.git
Change into the project directory:
cd iam-user-group-pcp

Modify the main.tf file to specify the IAM User and Group details as needed. You can customize the user name, group name, password policy, and other attributes.
Initialize Terraform in the project directory:
terraform init

Review the execution plan to ensure it matches your desired configuration:
terraform plan

Apply the Terraform configuration to create the IAM User and Group:
terraform apply

Confirm the action by typing "yes" when prompted.
Once the execution is complete, Terraform will output the details of the IAM User created.
Share the IAM User's details with the respective user for them to access AWS services.

## Cleanup
To remove the IAM User and Group, follow these steps:
Change into the project directory:
cd iam-user-group-pcp

Run the Terraform destroy command:
terraform destroy

Confirm the action by typing "yes" when prompted.

Customization
You can customize the IAM User and Group settings by modifying the main.tf file. Refer to the AWS documentation for more details on available IAM attributes and password policy settings.

