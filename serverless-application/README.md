#                                       Serverless Application Repository with Terraform
## Overview
This repository provides Terraform scripts and configurations to build a serverless application repository on AWS. The Serverless Application Repository (SAR) allows you to deploy and share serverless applications and components in a centralized location.

## Prerequisites
Before you get started, ensure you have the following prerequisites:
AWS Account: You should have an AWS account. If you don't have one, you can create an AWS account for free.
Terraform: Install Terraform on your local machine.
AWS CLI: Install and configure the AWS Command Line Interface (CLI) with your AWS credentials.

## Getting Started
Follow these steps to set up your serverless application repository:
Clone the Repository:
git clone https://github.com/MahiraTechnology/Mahira-medium.git

cd serverless-application

Terraform Configuration:
Update the main.tf file to customize your deployment settings. You can modify the SAR application name, description, authors, and other configurations.

Initialize Terraform:
Run the following command to initialize Terraform and download the necessary providers:
terraform init

Terraform Apply:
Apply the Terraform configuration to create your serverless application repository:
terraform apply

Terraform will prompt you to confirm the changes. Enter yes to proceed.

### Deployment:
After the Terraform deployment is successful, your serverless application repository will be created on AWS.

### Customization:
You can further customize your repository, add serverless applications, and manage it through the AWS Management Console.

### Clean Up
To tear down your serverless application repository, follow these steps:
Run the following command to destroy the AWS resources created by Terraform:
terraform destroy

Terraform will ask for confirmation. Enter yes to proceed.
Once the destroy operation is complete, your serverless application repository will be removed.
Additional Resources
Serverless Application Repository Documentation
Terraform Documentation