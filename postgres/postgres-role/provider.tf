terraform {
  required_providers {
    postgresql = {
      source = "cyrilgdn/postgresql"
      version = "1.19.0"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.8.0"
    }
  }
}
