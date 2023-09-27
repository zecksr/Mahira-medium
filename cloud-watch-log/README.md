#                                        Implementing Long-Term CloudWatch Log Retention Using Terragrunt

This repository contains Terraform and Terragrunt configurations to implement long-term retention for CloudWatch Logs in your AWS environment. By using this infrastructure as code (IaC) approach, you can easily manage and automate the configuration of log retention settings for your CloudWatch Logs.

## Prerequisites
Before you begin, ensure you have the following prerequisites:
Terraform installed.
Terragrunt installed.
AWS IAM credentials configured with appropriate permissions.
S3 bucket should be created in the aws account to store the lock files.

## Getting Started
Follow these steps to deploy the CloudWatch dashboard:

Clone this repository to your local machine:
git clone https://github.com/MahiraTechnology/Mahira-medium.git

Navigate to the environment you want to deploy (e.g., dev, prod) using Terragrunt:
cd cloud-watch-log/log-group

Initialize the Terragrunt working directory:
terragrunt init

Apply the Terragrunt configuration to create the CloudWatch dashboard:
terragrunt apply

When prompted, review the changes and confirm the deployment.

Configuration
In the terraform files or Terragrunt configuration files, you can customize the following parameters:
region: The AWS region where the CloudWatch dashboard will be created.

Usage
After the infrastructure has been deployed, the CloudWatch log retention policies will be in effect based on your configuration. You can customize the retention settings further by editing the Terragrunt files as needed.

## Cleaning Up
To destroy the CloudWatch dashboard and associated resources, run:
terragrunt destroy