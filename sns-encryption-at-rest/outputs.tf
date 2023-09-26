output "topic_arn" {
  value = aws_sns_topic.this.arn
}

output "kms_master_key_id" {
  value = aws_kms_key.this.key_id
}

