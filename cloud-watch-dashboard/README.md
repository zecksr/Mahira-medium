#                                                 CloudWatch Dashboard for Monitoring EC2 Instance using Terragrunt
 CloudWatch Dashboard

This repository contains Terraform and Terragrunt code to create a CloudWatch dashboard for monitoring EC2 instances. CloudWatch dashboards provide visualizations and insights into the performance and health of your AWS resources, including EC2 instances. By setting up a CloudWatch dashboard, you can easily track metrics, set up alarms, and gain real-time visibility into your infrastructure.

## Features
Create a CloudWatch dashboard that displays key performance metrics of your EC2 instances.
Monitor CPU utilization, network activity, and other essential metrics in a single view.
Set up automated alerts and notifications based on predefined thresholds.
Utilize Terragrunt to manage infrastructure across multiple environments.

## Prerequisites
Before you begin, ensure you have the following:

AWS Account: Access to an AWS account with necessary permissions to create resources.
Terraform and Terragrunt: Install Terraform and Terragrunt.
EC2 Instances: One or more EC2 instances to monitor.
S3 bucket & DynamoDb : create a S3 bucket and Dynamo db table to store remote state files. 

## Getting Started
Clone this repository:
git clone https://github.com/MahiraTechnology/Mahira-medium.git
cd cloud-watch-dashboard

## Deploy using Terragrunt:
1. Configure your aws credentials.
2. Navigate to the cloud-watch folder in terminal and 
3. Run Terragrunt commands to initialize and apply the configuration:

terragrunt init
terragrunt apply
Access the Dashboard:

Once the deployment is complete, log in to your AWS Management Console and navigate to the CloudWatch dashboard section. You should see the newly created dashboard with metrics for the specified EC2 instances.

### Customization
Feel free to customize the dashboard by adding more widgets, adjusting metric configurations, or including additional AWS resources.

### Clean Up
To delete the CloudWatch dashboard and associated resources, run the following Terragrunt commands in the live folder:

terragrunt destroy