#                                           Seamless AWS CloudWatch Alarm Notifications in Microsoft Teams: A Terraform-Driven Integration

## Overview
This repository provides Terraform code and configuration files to set up seamless AWS CloudWatch alarm notifications in Microsoft Teams. With this integration, you can receive real-time alerts and notifications from AWS CloudWatch alarms directly in your Microsoft Teams channels.

## Prerequisites
Before you begin, make sure you have the following prerequisites:

AWS Account: You need an AWS account with sufficient permissions to create CloudWatch alarms and IAM roles.
Terraform Installed: Install Terraform on your local machine.
Microsoft Teams: Access to your Microsoft Teams account, where you can create and configure an incoming webhook connector.
Git: Optional but recommended for version control and code management.

## Getting Started
Clone the Repository: Clone this GitHub repository to your local machine using the following command:

git clone https://github.com/MahiraTechnology/Mahira-medium.git
cd aws-chatbot
AWS Configuration: Configure your AWS credentials and region. You can do this by exporting environment variables or using an AWS credentials file.

### Terraform Configuration:

Open the terraform/main.tf file and customize it according to your requirements. 

Terraform Initialization and Deployment:
terraform init
terraform plan
terraform apply

### Microsoft Teams Configuration:

In your Microsoft Teams channel, click the ellipsis (...) and choose "Connectors."
Search for and select "Incoming Webhook."
Configure the webhook, provide a name and upload an image if desired. Copy the webhook URL generated.

### Usage
Once the setup is complete, whenever the AWS CloudWatch alarm is triggered, it will send a notification to your Microsoft Teams channel through the configured webhook.

### Cleanup
To tear down the resources created by Terraform, run the following commands:

terraform destroy 