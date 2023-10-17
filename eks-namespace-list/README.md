#                                                       Mastering Kubernetes Access: Creating an EKS Cluster Role for Namespace Listing using Terraform

##  Table of Contents
Overview
Prerequisites
Terraform Configuration
Usage

## Overview
This Terraform project demonstrates how to create an Amazon Elastic Kubernetes Service (EKS) cluster role that provides the necessary permissions to list namespaces within the cluster. Kubernetes access control is a crucial part of securing your EKS environment, and this project simplifies the process of role creation.
With this Terraform configuration, you can quickly set up a role that allows you to list namespaces within your EKS cluster. It's a valuable resource for managing, monitoring, and controlling your cluster resources.

## Prerequisites
Before you begin, ensure you have the following prerequisites:
AWS CLI: Make sure you have the AWS Command Line Interface (CLI) installed and configured with your AWS credentials. You can install it from here.
Terraform: Install Terraform on your local machine. You can download it from here.
AWS IAM Permissions: You need permissions to create and manage IAM roles and policies in your AWS account.
Kubernetes Configuration: Ensure your kubeconfig is set up correctly to access your EKS cluster.
Terraform Configuration
The Terraform configuration in this repository consists of the following files:

main.tf: Defines the AWS IAM role and its associated policies.
variables.tf: Declares input variables.
outputs.tf: Specifies the output values of the Terraform configuration.

## Usage
Follow these steps to create the EKS cluster role using Terraform:
Clone this repository to your local machine:
git clone https://github.com/MahiraTechnology/Mahira-medium.git

Change into the project directory:
cd eks-namespace-list

Initialize the Terraform configuration:
terraform init

Apply the Terraform configuration:
terraform apply

Confirm the action by entering yes when prompted.
After Terraform completes the role creation, you can access the role's ARN in the Terraform output. You can then associate this role with your Kubernetes service accounts to grant them the necessary permissions.

To destroy the created resources when they are no longer needed, run:
terraform destroy
Confirm the action by entering yes when prompted