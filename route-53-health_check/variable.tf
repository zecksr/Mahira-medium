#variable.tf
variable "domain_name" {
  type    = string
  default = "my_domain.com"
}

variable "topic_name" {
  type    = string
  default = "route-53-sns-topic"
}

variable "region" {
  type    = string
  default = "us-east-1"
}