#                                               Securing Your Deployed SNS Topics: Enabling At-Rest Encryption with AWS KMS

## Overview
This repository provides a guide and resources for securing your deployed AWS Simple Notification Service (SNS) topics by enabling at-rest encryption with AWS Key Management Service (KMS). SNS is a highly scalable and reliable service used for sending messages or notifications to distributed systems or microservices. Enabling encryption helps protect the data stored within your SNS topics.

## Table of Contents
Introduction
Prerequisites
Step-by-Step Guide

## Introduction
Security is a paramount concern in modern cloud-based applications. AWS provides robust security features, including encryption services such as AWS Key Management Service (KMS). By enabling at-rest encryption for your SNS topics, you add an extra layer of protection to your data.
In this guide, we'll walk you through the process of enabling at-rest encryption for your deployed SNS topics using AWS KMS.

## Prerequisites
Before you begin, ensure that you have the following prerequisites in place:

- An AWS account with appropriate permissions to configure SNS topics and KMS.
- AWS CLI or SDKs configured with access credentials.
- Basic knowledge of AWS SNS and KMS.
- Terraform should be installed

## Step-by-Step Guide
Follow these steps to enable at-rest encryption for your AWS SNS topics:

### Getting Started

1. Clone this repository to your local machine:
    git clone https://github.com/MahiraTechnology/Mahira-medium.git

  Change into the project directory:
    cd sns-encryption-at-rest

### Usage
Follow these steps to enable at-rest encryption for your SNS topics:
Review and customize the Terraform configuration in the main.tf file to suit your environment and requirements.

Initialize the Terraform working directory:
terraform init

Create an execution plan:
terraform plan

Apply the changes to create the necessary resources:
terraform apply

Confirm the changes by typing yes when prompted.
Terraform will provision the required resources, including the AWS KMS key and configure your SNS topics for at-rest encryption.
