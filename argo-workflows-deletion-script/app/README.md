#                                                 Efficient Argo Workflow Deletion and ECR Image Integration Script
This repository contains a Python script that allows you to efficiently delete old Argo Workflows and integrate with Amazon Elastic Container Registry (ECR) images. The script automates the process of identifying and deleting Argo Workflows older than a specified threshold, ensuring better resource management. Additionally, it provides integration with ECR for seamless container image handling.

## Features
Deletes old Argo Workflows that are older than a specified threshold.
Efficiently manages resources and prevents unnecessary clutter in your Kubernetes cluster.
Integrates with ECR to handle container images efficiently.

## Requirements
Python 3.x
AWS CLI configured with proper credentials
Argo CLI installed (for workflow deletion)
Access to the Kubernetes cluster where Argo Workflows are running
Docker (for building the Docker image)

### ECR Image Integration
The yaml file also demonstrates ECR image integration. Ensure your ECR repository URL is properly configured in the workflow.yaml. You can use this yaml as a starting point for more complex ECR-related tasks.

## Installation and Usage
Clone this repository:
git clone https://github.com/MahiraTechnology/Mahira-medium.git
cd argo-workflows-deletion-script

Modify the script to set the appropriate threshold and other configuration options.

Install the required Python packages:
pip install -r requirements.txt

Create a ECR Repository:
Login to your AWS account and create an Private ECR repository in your aws account.

After the ECR repository is being created, build a docker image using the docker file provided in this directory.

Build your Docker image using the following command.
docker build -t argo-workflows .

Once building the Image is being completed Login to your ECR repository using below command
aws ecr get-login-password --region ca-central-1 | docker login --username AWS --password-stdin 123456789.dkr.ecr.ca-central-1.amazonaws.com

After the Login is Succeded, tag your image so you can push the image to this repository:
docker tag argo-workflows:latest 123456789.dkr.ecr.ca-central-1.amazonaws.com/argo-workflows:latest

Run the following command to push this image to your newly created AWS repository:
docker push 123456789.dkr.ecr.ca-central-1.amazonaws.com/argo-workflows:latest

#### Run the Workflow:
Configure your Argo-workflow and Submit the Workflow using below command
argo submit workflow.yaml -n argo

Once the Workflow runs successfully,u can see that the argo-workflows which is older than 2 days got deleted using this workflow.

The script will identify and delete old Argo Workflows, providing improved cluster resource management.



