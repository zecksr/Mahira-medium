#                                                      Empower Your Database Security: Creating a Postgres Read-Only User with Terraform

## Table of Contents
Introduction
Prerequisites
Getting Started
Usage

## Introduction
Database security is paramount in today's data-driven world. One fundamental aspect of securing your database is managing user access effectively. In PostgreSQL, creating a read-only user is a common practice to restrict access for certain use cases, such as analytics or reporting.

This Terraform project provides an automated way to create a read-only user in your PostgreSQL database. By using Terraform, you can version-control your infrastructure as code, making it easier to manage, track changes, and collaborate with your team.

In this guide, we'll walk through the steps to create a PostgreSQL read-only user with Terraform. This user will have restricted privileges, ensuring that sensitive data remains secure.

## Prerequisites
Before you begin, ensure you have the following prerequisites:

PostgreSQL Database: You should have an existing PostgreSQL database up and running, where you want to create the read-only user.
Terraform: Install Terraform on your local machine.
Database Connection Details: Gather information about your PostgreSQL database, including the host, port, database name, and an administrative user with sufficient privileges to create roles and assign permissions.

## Getting Started
Clone the Repository
Start by cloning this GitHub repository to your local machine:

git clone https://github.com/MahiraTechnology/Mahira-medium.git
cd postgres

Navigate to the postgres-db directoy and run below terraform commands to create a postgres-db
terraform init
terraform plan
terraform apply

Once the postgres-db gets created, next navigate to the postgres-role directory to create a read-only user.
run terrafom init command to install the required packages.

Apply the Terraform configuration to create the read-only user:
terraform apply

Terraform will prompt you to confirm the creation of the user. Type yes to proceed.

## Usage
With the Terraform configuration applied, the read-only user is created in your PostgreSQL database. You can now use this user's credentials to connect to the database with read-only privileges.

This project provides a foundation for managing database user roles and permissions with Terraform. You can extend it to include additional users or modify roles to suit your specific security requirements.