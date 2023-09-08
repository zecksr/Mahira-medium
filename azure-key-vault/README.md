#                                                               Creating a Key Vault in Azure Using Terraform

This repository contains Terraform code that demonstrates how to create a Key Vault in Microsoft Azure. Key Vault is a secure and centralized service for managing and safeguarding cryptographic keys, secrets, and certificates.

By following the instructions below, you can easily deploy a Key Vault in your Azure environment using Terraform.

## Prerequisites
Before you begin, ensure you have the following prerequisites:
Azure Subscription: You should have an active Azure subscription. If you don't have one, you can create a free Azure account.
Terraform: Install Terraform on your local machine.
Azure CLI: Install the Azure CLI for managing Azure resources.

## Getting Started
Clone this repository to your local machine:
git clone https://github.com/MahiraTechnology/Mahira-medium.git

Change into the project directory:
cd azure-key-vault

Initialize Terraform:
terraform init

Apply the Terraform configuration:
terraform apply

Terraform will display a plan outlining the resources it will create. Confirm the action by typing yes when prompted.
Once the deployment is complete, Terraform will output information about the created Key Vault.
Accessing Your Key Vault
You can access and manage your Key Vault using the Azure Portal or the Azure CLI. To access your Key Vault via the Azure CLI, use the following command:

az keyvault show --name my-keyvault --resource-group my-resource-group

Replace my-keyvault and my-resource-group with your Key Vault name and resource group.

Destroying Resources
If you want to remove the Key Vault and all associated resources, use the following command:
terraform destroy

Terraform will prompt you to confirm the destruction of the resources.

## Conclusion

This repository provides a simple example of how to create a Key Vault in Azure using Terraform. You can use this as a starting point and customize it to meet your specific requirements. Azure Key Vault is a powerful service for managing sensitive data, and with Terraform, you can easily automate its deployment and configuration.