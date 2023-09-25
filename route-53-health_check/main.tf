# Create an SNS topic for the alarm actions
resource "aws_sns_topic" "sns_topic" {
    name = var.topic_name
}

resource "aws_cloudwatch_metric_alarm" "healthcheck_alarm" {
  alarm_name          = "route-53-health_check_alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "HealthCheckStatus"
  namespace           = "AWS/Route53"
  period              = 60
  statistic           = "Minimum"
  threshold           = 1
  alarm_description   = "This metric monitors route-53-healthchecks"
  actions_enabled     = "true"
  alarm_actions       = [aws_sns_topic.sns_topic.arn]
  treat_missing_data  = "breaching"
  dimensions = {
      HealthCheckId = aws_route53_health_check.route-53_healthcheck.id
   }
  depends_on = [
     aws_route53_health_check.route-53_healthcheck
    ]
}

# Define the health check resource
resource "aws_route53_health_check" "route-53_healthcheck" {
  fqdn              = "record.${var.domain_name}"
  port              = 443 
  type              = "HTTPS"
  resource_path     = "/auth/login"
  failure_threshold = "5"
  request_interval  = "30"
  #alarm_identifier  = "realogy-app-${var.env_name}-health_check_alarm"
  cloudwatch_alarm_name = aws_cloudwatch_metric_alarm.healthcheck_alarm.name
  cloudwatch_alarm_region = "${var.region}"
  tags = {
    Name = "route-53-health_checks"
  }
}