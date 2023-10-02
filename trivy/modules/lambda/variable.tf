variable "dashboard_name" {
    type = string
    description = "Name of the Dashboard"
}

variable "alarm_name" {
   type = string
   description = "Alarm name"
}

variable "region" {
   type = string
   description = "default region"
}

variable "lambda_function_name" {
  type = string
  description = "Lambda Function name"
}

variable "lambda_function_arn" {
    type   = string
    description = "lambda function arn"
}
