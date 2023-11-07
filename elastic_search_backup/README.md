#                                               ElasticSearch Daily Backup and Snapshot Deletion Using Lambda Function

This repository contains code and configuration for setting up a serverless solution to automate daily backups and snapshot deletion for your ElasticSearch clusters using AWS Lambda.

## Overview

Backing up your ElasticSearch data and managing snapshots is crucial for ensuring data resilience and recovery. This solution provides an automated way to create daily backups of your ElasticSearch indices and manage snapshots efficiently. It's built using AWS Lambda, AWS CloudWatch Events, and AWS ElasticSearch Service.

## Features

Automated Daily Backups: A Lambda function is triggered by a CloudWatch Events rule on a daily schedule to create backups of your ElasticSearch indices.
Snapshot Management: The solution allows you to manage the retention of your snapshots. You can specify how many days of snapshots you want to retain, and older snapshots will be automatically deleted.
Logging and Monitoring: The Lambda function logs its activities, allowing you to monitor the backup and snapshot deletion process.
Cost-Effective: By using serverless architecture, you only pay for the compute resources used when the Lambda function runs.

## Prerequisites
Before using this solution, make sure you have the following in place:

An AWS account.
ElasticSearch clusters that you want to back up and manage snapshots for.
AWS CLI and SAM CLI installed and configured.

## Installation and Configuration
Clone this repository to your local environment.
Navigate to the lambda directory and customize the lambda_script.py file. This file contains configuration options, including the AWS ElasticSearch endpoint, the desired snapshot retention period, and the Lambda function execution role.

Deploy the Lambda function using the AWS Serverless Application Model (SAM) CLI. Run the following command in the lambda directory:

Follow the prompts to configure the deployment.
Once the Lambda function is deployed, you need to set up the CloudWatch Events rule to trigger the function daily. You can do this using the AWS Management Console or the AWS CLI.
Monitor the Lambda function's execution logs in CloudWatch Logs to ensure that backups and snapshot deletions are occurring as expected.

## Usage
The Lambda function will automatically create daily snapshots of your ElasticSearch indices and manage the retention of snapshots based on the configured retention period.

## Acknowledgments
This solution was inspired by the need to automate ElasticSearch backups and snapshot management for reliable data recovery.