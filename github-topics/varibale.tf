#variable.tf 

variable "repository" {
  type = string
  description = "name of the github repositroy"
  default  = "mahira"
}

variable "branch" {
  type = string
  description = "name of the github repository branch"
  default  = "mahira-medium"
}

variable "token" {
  type = string
  description = "github token"
  default  = "*************************"
}