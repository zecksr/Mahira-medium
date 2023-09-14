#                                               Automating AWS CodePipeline Setup with Terraform

This repository contains Terraform code that automates the setup of an AWS CodePipeline for your application. AWS CodePipeline is a continuous integration and continuous delivery (CI/CD) service that automates the build, test, and deployment phases of your release process. With this Terraform configuration, you can quickly provision a fully functional CodePipeline, complete with source code integration, build, and deployment stages.

## Prerequisites
Before you begin, ensure you have the following prerequisites:
Terraform (v0.15.0 or higher)
AWS account with appropriate permissions
AWS CLI configured with your credentials

## Usage
Clone this repository to your local machine:
git clone https://github.com/MahiraTechnology/Mahira-medium.git
cd codepipeline-terraform

## Initialize Terraform in the project directory:
terraform init

Modify the variables.tf file to customize the CodePipeline configuration to your specific requirements. You can adjust parameters like the source code repository, build environment, deployment settings, and more.
Review and apply the Terraform plan to create the CodePipeline:
terraform apply

Terraform will prompt you to confirm the changes. Type yes to proceed.
Wait for Terraform to provision the resources and create the CodePipeline. This may take a few minutes.
Once the process is complete, Terraform will output the URL of the newly created CodePipeline.

## Clean Up
If you want to tear down the CodePipeline and associated resources, you can use Terraform to destroy the infrastructure:
terraform destroy

Terraform will ask for confirmation before proceeding. Type yes to initiate the teardown.