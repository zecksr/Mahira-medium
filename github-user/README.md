#                                               Automating GitHub User Creation with Terraform:Streamlining Access Management

Welcome to the "Automating GitHub User Creation with Terraform" repository! This project demonstrates how to streamline access management on GitHub by automating the process of creating and managing GitHub users using Terraform.


## Table of Contents
Getting Started
Prerequisites
Installation
Usage
Configuration

## Getting Started

Managing user access to GitHub repositories and organizations can be a time-consuming task, especially as your organization scales. This repository provides a solution to simplify this process by leveraging the power of infrastructure as code (IAC) with Terraform.

## Prerequisites

Before you can use this Terraform configuration to automate GitHub user creation, make sure you have the following prerequisites in place:
Terraform installed on your local machine.
A GitHub account with administrative access to the organization or repository where you want to manage user access.
Personal Access Token (PAT) for your GitHub account. You can generate one here.

## Installation
Clone this repository to your local machine:
git clone https://github.com/MahiraTechnology/Mahira-medium.git

Change into the project directory:
cd github-user

Create a terraform.tfvars file to store your GitHub PAT and other configuration variables. Use the terraform.tfvars.example as a template.

Initialize the Terraform project:
terraform init

## Usage
To use this Terraform configuration to automate GitHub user creation, follow these steps:
Customize the configuration variables in the terraform.tfvars file to match your GitHub organization and user details.

Apply the Terraform configuration:
terraform apply

Terraform will prompt you to confirm the changes. Type yes to proceed.
Terraform will create the specified GitHub users and grant them access to the defined repositories or organizations.
Verify the changes on GitHub, and the users should now have access as configured.

## Configuration
github_token: Your GitHub Personal Access Token.
organization_name: The name of your GitHub organization.
users: A list of user objects with their login, email, and role (member or admin).
repositories: A list of repository objects with their name and the teams you want to grant access to.