variable "location" {
 type    = string 
 default = "northeurope"
 description     = "The location where the resource group should be  created. For a list of all Azure location" 
}

variable "env_name" {
  type    = string 
  default = "dev"
  description = "Type of environment ex: dev, stage or prod"
}

variable "project_name" {
  type    = string 
  default = "azure-test"
  description = "project name"
}
variable "rg" {
  type    = string 
  default = "azure-test-rg"
  description = "resource group name"
}
