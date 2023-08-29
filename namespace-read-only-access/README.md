#                                        Implementing Read-Only Access For a Specific Namespace in Amazon EKS Cluster

This repository contains Terraform code to implement read-only access for a specific namespace in an Amazon EKS cluster. This setup is useful when you want to grant users or groups the ability to view resources within a particular namespace without the ability to make changes.

## Prerequisites

Before you begin, ensure you have the following:

An Amazon EKS cluster up and running.
Terraform installed on your machine.
AWS credentials configured for Terraform.

## Terraform Code

The provided Terraform code in this repository sets up the necessary Kubernetes resources to achieve read-only access to a specific namespace. It creates a ClusterRole that defines the read-only permissions and a RoleBinding that associates this role with a user group.

### ClusterRole: namespace-read_only-role
This ClusterRole defines the allowed resources and verbs for read-only access within the targeted namespace. The following resources and verbs are permitted:

Pods, Services, ConfigMaps, Secrets, ReplicationControllers: get, list
Jobs, CronJobs: get, list
DaemonSets, Deployments, ReplicaSets, StatefulSets: get, list

HorizontalPodAutoscalers: get, list
Workflows (from the argoproj.io API group): get, list

RoleBinding: namespace-read_only-role_binding
This RoleBinding associates the ClusterRole with a specific group (in this case, aws-eks-users) within the argocd namespace. This binding ensures that users within the aws-eks-users group have read-only access to the specified namespace.

## Usage
Clone this repository to your local machine.
Navigate to the namespace-read-only-access directory.
Modify the variables.tf file to set the appropriate values for your environment.
Run terraform init to initialize the Terraform configuration.
Run terraform apply to create the resources in your EKS cluster.
Once the resources are created, the read-only access will be granted to the specified namespace for the designated group.

## Note
Ensure that you have the necessary AWS permissions to create and manage EKS resources.
Modify the ClusterRole and RoleBinding definitions as needed to suit your specific use case.
