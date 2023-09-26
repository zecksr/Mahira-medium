#main.tf
data "aws_caller_identity" "current" {}

resource "aws_sns_topic" "this" {
  name = var.topic_name
  kms_master_key_id = aws_kms_key.this.arn  
}

resource "aws_sns_topic_policy" "this" {
  arn = aws_sns_topic.this[0].arn
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Id": "__default_policy_ID",
  "Statement": [
    {
      "Sid": "__default_statement_ID",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": [
        "SNS:GetTopicAttributes",
        "SNS:SetTopicAttributes",
        "SNS:AddPermission",
        "SNS:RemovePermission",
        "SNS:DeleteTopic",
        "SNS:Subscribe",
        "SNS:ListSubscriptionsByTopic",
        "SNS:Publish",
        "SNS:Receive"
      ],
      "Resource": "${aws_sns_topic.this[0].arn}",
      "Condition": {
        "ArnEquals": {
          "aws:SourceArn": "${aws_sns_topic.this[0].arn}"
        }
      }
    }
  ]
}
EOF
}
resource "aws_kms_key" "this" {
  description             = "Example KMS key for SNS encryption"
  deletion_window_in_days = 10
  policy                  = <<EOF
{
  "Version": "2012-10-17",
  "Id": "key-default-1",
  "Statement": [
    {
      "Sid": "Enable IAM User Permissions",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      },
      "Action": "kms:*",
      "Resource": "*"
    },
    {
      "Sid": "Enable SNS Encryption",
      "Effect": "Allow",
      "Principal": {
        "Service": "sns.amazonaws.com"
      },
      "Action": [
        "kms:GenerateDataKey",
        "kms:Decrypt"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}