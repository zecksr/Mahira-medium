terraform {
  source = "tfr:///terraform-aws-modules/s3-bucket/aws?version=3.4.0"
}

include "root" {
  path = find_in_parent_folders()
}

locals {
  region      = "us-east-1"
}

inputs = {
  bucket = "imw-prospect-uploads"
  
    lifecycle_rule = [
    {
      id      = "ChangeToGlacier"
      enabled = true
      
      transition = [
        {
          days          = 365
          storage_class = "GLACIER"
        }
      ]  
    }
  ]
}