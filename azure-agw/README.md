#                                   Build an Azure Application Gateway with Terragrunt

## Overview
This repository contains Terraform and Terragrunt configurations to deploy an Azure Application Gateway. An Azure Application Gateway is a web traffic load balancer that enables you to manage traffic to your web applications. It provides features like SSL termination, URL-based routing, and more, making it a crucial component for scalable and secure web applications.

## Prerequisites
Before you begin, ensure you have the following prerequisites:
Azure Subscription: You need an active Azure subscription. If you don't have one, you can create a free Azure account.
Terraform and Terragrunt: Install Terraform and Terragrunt.

## Getting Started
Clone this repository to your local machine:
git clone https://github.com/MahiraTechnology/Mahira-medium.git
cd azure-agw/gateway

## Initialize Terragrunt:
terragrunt init

## Deploy the Azure resources:
terragrunt apply

Terragrunt will prompt you to confirm the deployment. Review the changes and type yes to proceed.

## Configuration
The configuration for the Application Gateway is defined in the terragrunt.hcl file located in the root directory. You can customize the following parameters:

location: The Azure region where the Application Gateway will be deployed.
name_prefix: A prefix for naming the resources.
sku: The SKU (size) of the Application Gateway.
frontend_ports: Define frontend ports to listen on.
frontend_ip_configuration: Configure frontend IP addresses.
backend_pools: Define backend pools for routing traffic.
http_listeners: Configure HTTP listeners and routing rules.
ssl_certificates: Configure SSL certificates if needed.
Make sure to modify these settings according to your requirements.

## Deploying Updates
If you need to make changes to your Application Gateway configuration, you can follow these steps:
Modify the terragrunt.hcl or Terraform configuration files with your changes.
Run terragrunt apply again to apply the changes to your Azure resources.
Terragrunt will show you a preview of the changes. Confirm by typing yes.

## Cleanup
To destroy the Azure resources created by this configuration, run:
terragrunt destroy
Terragrunt will prompt you to confirm the destruction of resources. Be cautious, as this action is irreversible.

## Conclusion
This repository provides a structured and automated way to deploy an Azure Application Gateway using Terraform and Terragrunt. It simplifies the process of managing your web traffic and ensures your applications are highly available and scalable.