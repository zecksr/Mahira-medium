terraform {
  source = "../module"
}

locals {
  region      = "us-east-1"
}

 inputs = {
  alarm_name  = "lambda-monitor-alarm"
  dashboard_name = "lambda-dashboard"
  region        = local.region
  lambda_function_name  = "YOUR LAMBDA FUNCTION NAME"
  lambda_function_arn  = "YOUR LAMBDA FUNCTION ARN"
 }