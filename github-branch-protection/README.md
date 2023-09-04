#                                                           Terraform GitHub Branch Protection Settings

This Terraform code allows you to create and manage branch protection settings for your GitHub repositories. Branch protection settings help enforce quality and security standards in your development process by specifying rules and restrictions for branch management.

## Table of Contents
Prerequisites
Getting Started
Configuration
Usage

## Prerequisites
Before you begin, ensure you have met the following requirements:

Terraform Installed: You must have Terraform installed on your local machine. You can download it from the official Terraform website.

GitHub Personal Token: You need a GitHub personal access token with the required permissions. Make sure to keep it secure.

GitHub Repository: Create a GitHub repository where you want to apply branch protection settings.

## Getting Started
To get started, follow these steps:

Clone this repository or copy the main.tf and variables.tf files to your Terraform project directory.

Initialize your Terraform workspace:
terraform init

Configure your GitHub access token as a Terraform variable. You can use environment variables or directly edit the variables.tf file.

## Configuration
In the variables.tf file, you can configure the following variables:

github_token: Your GitHub personal access token.
repo_name: The name of the GitHub repository.
branch_name: The name of the branch you want to protect.
dismiss_stale_reviews: Set to true to dismiss stale pull request reviews.
required_pull_request_reviews: A map of settings for required pull request reviews.
restrict_push_access: Set to true to restrict who can push to the protected branch.

## Usage
After configuring the variables, you can apply the Terraform configuration to create branch protection settings. Run the following commands:

terraform plan
terraform apply

Terraform will display the changes it intends to make. If everything looks correct, confirm the changes