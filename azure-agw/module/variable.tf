variable "network_ddos_protection_plan_name" {
type            = string
description  = ""
}
variable "location" {
type            = string
description     = "The location where the resource group should be created. For a list of all Azure location"
}
variable "env_name" {
type        = string
description = "Type of environment ex: dev, stage or prod"
}
variable "local_dir" {
type        = string
description = "local account directory name"
}
variable "azure_region" {
type        = string
description = "azure location"
}
variable "project_name" {
type        = string
description = "project name"
}
variable "account_name" {
type        = string
description = "account name"
}