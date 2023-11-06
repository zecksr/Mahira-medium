#provider.tf
terraform {
  required_providers {
    github = {
     source = "integrations/github"
     version = "5.29.0"
    }
  }
}