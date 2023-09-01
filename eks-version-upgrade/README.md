#                                                        Upgrading Amazon EKS Cluster Version Using Terraform

## Overview
This repository provides Terraform configurations and scripts to upgrade your Amazon Elastic Kubernetes Service (EKS) cluster to a new Kubernetes version. Amazon EKS is a fully managed Kubernetes service, and upgrading your cluster's version ensures you have access to the latest features, security updates, and bug fixes.

This guide and the accompanying Terraform configurations will help you automate the version upgrade process, making it seamless and repeatable. It's essential to keep your EKS cluster up to date to benefit from the latest Kubernetes capabilities and maintain a secure and efficient container orchestration environment.

## Prerequisites
Before you begin, make sure you have the following prerequisites:
Terraform: You should have Terraform installed on your local machine or your CI/CD environment. You can download Terraform from here.
AWS CLI: You need the AWS Command Line Interface (CLI) configured with the necessary permissions to manage your EKS cluster. You can install and configure it by following the AWS CLI documentation.
Kubectl: You should have kubectl installed and configured to interact with your EKS cluster. You can install kubectl by following the Kubernetes documentation.
Existing EKS Cluster: You should have an existing Amazon EKS cluster that you want to upgrade.

## Usage
Follow these steps to upgrade your Amazon EKS cluster using Terraform:
Clone the Repository: Clone this repository to your local machine or your CI/CD environment.
git clone https://github.com/MahiraTechnology/Mahira-medium.git
cd eks-version-upgrade

Configure Terraform: Create a terraform.tfvars file in the repository root and provide the required variables. You can use the terraform.tfvars.example file as a template.

Initialize Terraform: Run the following commands to initialize Terraform and download the necessary provider plugins.
terraform init

Plan the Upgrade: Use the terraform plan command to see what changes Terraform will apply to your EKS cluster.
terraform plan

Apply the Upgrade: If the plan looks correct, apply the changes to your EKS cluster.
terraform apply

Monitor the Upgrade: Monitor the upgrade process as Terraform applies the changes to your EKS cluster. You can use the AWS EKS console, CloudWatch logs, and kubectl to ensure the upgrade is successful.

Cleanup (Optional): If you encounter issues during the upgrade, you can use Terraform to roll back the changes and restore your cluster to the previous state.
terraform destroy