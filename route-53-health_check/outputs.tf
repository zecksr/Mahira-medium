#outputs.tf
output "sns_topic_arn" {
 value = aws_sns_topic.sns_topic.arn
}
output "cloudwatch_metric_alarm_arn" {
 value = aws_cloudwatch_metric_alarm.healthcheck_alarm.arn
}