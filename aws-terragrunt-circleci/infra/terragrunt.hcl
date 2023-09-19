# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# Terragrunt is a thin wrapper for terraform-code that provides extra tools for working with multiple terraform-code modules,
# remote state, and locking: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

generate "provider__global" {
  path      = "provider__global.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
  provider "aws" {
  region = "us-east-1"
    default_tags {
      tags = {
          Environment = "dev"
          Project     = "circleci"
        }
    }
  }


provider "aws" {
  alias = "circleci-aws-v2"
  region = "us-east-1"
  profile = "YOUR AWS PROFILE NAME"
  allowed_account_ids = ["123456789"]
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.61.0"
    }
  }
}
EOF
}

# Configure Terragrunt to automatically store tfstate files in an S3 bucket
remote_state {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = "YOUR S3 BUCKET NAME"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}


# ---------------------------------------------------------------------------------------------------------------------
# GLOBAL PARAMETERS
# These variables apply to all configurations in this subfolder. These are automatically merged into the child
# `terragrunt.hcl` config via the include block.
# ---------------------------------------------------------------------------------------------------------------------


