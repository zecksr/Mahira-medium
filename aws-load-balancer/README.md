#                                        Managing AWS Load Balancer Idle Timeout with Terragrunt

This repository contains Terraform and Terragrunt code to manage the idle timeout settings of AWS Application Load Balancers (ALB). By using this code, you can easily configure and maintain the idle timeout value for your ALB resources across different environments.

## Prerequisites
Before you begin, ensure you have the following prerequisites:
Terraform installed.
Terragrunt installed.
AWS IAM credentials configured with appropriate permissions.
S3 bucket should be created in the aws account to store the lock files.

## Getting Started
Follow these steps to deploy the Load balancer Idle timeout :

Clone this repository to your local machine:
git clone https://github.com/MahiraTechnology/Mahira-medium.git

Navigate to the environment you want to deploy (e.g., dev, prod) using Terragrunt:
cd aws-load-balancer/idle_time-out

Initialize the Terragrunt working directory:
terragrunt init

Apply the Terragrunt configuration to create the Load Balancer with Idle Time-out :
terragrunt apply

When prompted, review the changes and confirm the deployment.

Configuration
In the terraform files or Terragrunt configuration files, you can customize the following parameters:
region: The AWS region where the Load Balancer will be created.

Usage
To apply the configuration for a specific environment, navigate to the corresponding environment folder and run Terragrunt commands.

## Cleaning Up
To destroy the Load Balancer and associated resources, run:
terragrunt destroy