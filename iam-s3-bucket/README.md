#                                           Create an S3 Bucket and Assign Full Access to One IAM User using Terraform

This repository contains Terraform code and instructions for creating an Amazon S3 bucket and assigning full access to a specific IAM user. This is a common setup when you want to give a user complete control over an S3 bucket within your AWS account.

## Prerequisites

Before you begin, make sure you have the following:

1. Terraform installed on your local machine.
2. AWS credentials configured with sufficient permissions to create resources (IAM user and S3 bucket) within your AWS account.

## Usage

Follow these steps to create the S3 bucket and assign full access to an IAM user:

1. Clone this repository to your local machine:
   git clone https://github.com/yourusername/terraform-s3-iam.git

Change into the project directory:
    cd iam-s3-bucket

Configure your Aws credentials using aws configure

Initialize the Terraform project:
terraform init

Review and customize the main.tf file to configure the S3 bucket settings, IAM user, and permissions as needed.

Apply the Terraform configuration to create the resources:
terraform apply

Confirm the action by typing "yes" when prompted.

Terraform will create the S3 bucket and IAM user and assign full access to the user.

When you're done with the resources, you can destroy them:
terraform destroy

Confirm the action by typing "yes" when prompted.

Cleanup
After you've finished testing or using the resources, it's essential to clean up to avoid incurring additional AWS charges. You can do this by running terraform destroy.