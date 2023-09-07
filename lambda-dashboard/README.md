#                                                Deploying a CloudWatch Dashboard for Monitoring Lambda Functions Using Terragrunt

This repository contains Terraform and Terragrunt code for deploying a CloudWatch dashboard to monitor your AWS Lambda functions. With this dashboard, you can gain insights into the performance and health of your serverless functions.

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
cd lambda-dashboard/lambda

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