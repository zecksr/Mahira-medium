#                                                           Automating GitHub Team Creation with Terraform

This repository provides Terraform configurations and scripts to automate the creation and management of GitHub teams and their associated permissions. Managing teams and access control in GitHub can be a manual and error-prone process. This solution aims to streamline collaboration and access management by using infrastructure as code (IAC) principles with Terraform.

Table of Contents
Prerequisites
Getting Started
Configuration
Usage

## Prerequisites
Before you begin, ensure you have met the following requirements:
Terraform: You need to have Terraform installed on your local machine. You can download it from the official Terraform website.
GitHub Personal Access Token: You'll need a GitHub personal access token with the necessary permissions to manage teams and repositories. You can create one in your GitHub account settings.
GitHub Organization: You should have a GitHub organization where you want to manage teams and permissions.

## Getting Started
Clone this repository to your local machine:
git clone https://github.com/MahiraTechnology/Mahira-medium.git

Change into the project directory:
cd github-teams

Create a Terraform variable configuration file (e.g., terraform.tfvars) and provide the required variables:
github_token = "YOUR_GITHUB_PERSONAL_ACCESS_TOKEN"
github_organization = "YOUR_GITHUB_ORGANIZATION"
Replace YOUR_GITHUB_PERSONAL_ACCESS_TOKEN with your GitHub personal access token and YOUR_GITHUB_ORGANIZATION with your GitHub organization name.

## Configuration
The Terraform configuration in this repository is organized as follows:
main.tf: Contains the main Terraform configuration code, including the creation of teams and their permissions.
variables.tf: Defines input variables used in the Terraform configuration.
outputs.tf: Defines output values that can be useful after running Terraform.

## Usage
To use this automation tool to create GitHub teams and manage permissions, follow these steps:
Configure the variables in terraform.tfvars with your GitHub personal access token and organization name.
Customize the team configurations in the team_configurations/ directory by creating or modifying JSON files.

## Initialize the Terraform working directory:
terraform init

Plan the Terraform configuration:
terraform plan

Apply the Terraform configuration to create or update GitHub teams and permissions:
terraform apply

Verify the changes in your GitHub organization.
Note: Always review the Terraform plan before applying it to your GitHub organization to ensure it matches your intentions.
