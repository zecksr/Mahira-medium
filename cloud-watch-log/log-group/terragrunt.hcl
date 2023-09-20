#terragrunt.hcl

terraform {
  source  = "tfr:///terraform-aws-modules/cloudwatch/aws?version=4.2.1" 
}

include "root" {
 path = find_in_parent_folders()
}

locals {
 region        = "us-east-1"
}

inputs = {
  name              = "my-log-group"
  retention_in_days = 365
}