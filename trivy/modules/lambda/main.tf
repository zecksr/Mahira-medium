resource "aws_cloudwatch_dashboard" "lambda_dashboard" {
  dashboard_name = var.dashboard_name
  dashboard_body = jsonencode({
     widgets = [
       {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6
        properties = {
          metrics = [
            [
              "AWS/Lambda",
              "GetFunctionCodeSigningConfig",
              "FunctionName",
              "${var.lambda_function_name}",
              "Resource",
              "GetFunctionCodeSigningConfig"
            ],
            [
              "AWS/Usage",
              "CallCount",
              "Type",
              "API",
              ".",
              "GetFunctionCodeSigningConfig",
              "Service",
              "Lambda",
              "Class",
              "None"
            ],
          ]
          period = 300
          stat   = "Average"
          visible = false
          region = "${var.region}"
          title  = "Lambda Function SigningConfig"
        }
      },
      {
         type = "metric",
         x = 0,
         y = 6,
         width = 12,
         height = 6,
         properties = {
          metrics = [
            [
              "AWS/Lambda",
              "GetFunctionEventInvokeConfig",
              "FunctionName",
              "${var.lambda_function_name}",
              "Resource",
              "GetFunctionEventInvokeConfig"
            ],
            [
              "AWS/Usage",
              "CallCount",
              "Type",
              "API",
              ".",
              "GetFunctionEventInvokeConfig",
              "Service",
              "Lambda",
              "Class",
              "None"
            ],
          ]
          period = 300
          stat   = "Sum"
          visible = false
          region = "${var.region}"
           title = "Lambda Function Invocations"
        }
      },
      {
         type = "metric",
         x = 0,
         y = 12,
         width = 12,
         height = 6,
         properties = {
           metrics = [
            [
              "AWS/Lambda",
              "GetRuntimeManagementConfig",
              "FunctionName",
              "${var.lambda_function_name}",
              "Resource",
              "GetRuntimeManagementConfig"
            ],
            [
              "AWS/Usage",
              "CallCount",
              "Type",
              "API",
              ".",
              "GetRuntimeManagementConfig",
              "Service",
              "Lambda",
              "Class",
              "None"
            ],
          ]
          period = 300
          stat   = "Sum"
          visible = false
          region = "${var.region}"
           title = "Lambda Function Runtime Management"
        }
      }
    ]
  })
}

resource "aws_cloudwatch_metric_alarm" "duration_alarm" {
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "Duration"
  namespace           = "AWS/Lambda"
  period              = 300
  statistic           = "Average"
  threshold           = 5000
  alarm_description   = "This alarm is triggered if Lambda duration exceeds 5 seconds"
}


