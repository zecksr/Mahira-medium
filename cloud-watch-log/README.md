#                                        Implementing Long-Term CloudWatch Log Retention Using Terragrunt

This repository contains Terraform and Terragrunt configurations to implement long-term retention for CloudWatch Logs in your AWS environment. By using this infrastructure as code (IaC) approach, you can easily manage and automate the configuration of log retention settings for your CloudWatch Logs.


## Prerequisites
Before you begin, ensure you have the following prerequisites:
Terraform installed.
Terragrunt installed.
AWS IAM credentials configured with appropriate permissions.

## Getting Started
Follow these steps to deploy the CloudWatch dashboard:

Clone this repository to your local machine:
git clone https://github.com/MahiraTechnology/Mahira-medium.git

Navigate to the environment you want to deploy (e.g., dev, prod) using Terragrunt:
cd cloud-watch-log/log-group

Initialize the Terraform working directory:
terragrunt init

Apply the Terraform configuration to create the CloudWatch dashboard:
terragrunt apply

When prompted, review the changes and confirm the deployment.

Configuration
In the terraform files or Terragrunt configuration files, you can customize the following parameters:
region: The AWS region where the CloudWatch dashboard will be created.
lambda_functions: A list of Lambda function names or ARNs that you want to monitor.

## Usage
Once the CloudWatch dashboard is deployed, you can access it from the AWS Management Console. The dashboard provides visualizations and metrics related to your Lambda functions, helping you monitor their performance, errors, and invocation counts.

## Cleaning Up
To destroy the CloudWatch dashboard and associated resources, run:
terragrunt destroy