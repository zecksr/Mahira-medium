
resource "aws_wafv2_web_acl" "web_acl" {
  name  = var.web_acl_name
  description = "MahiraLoadBalancerWAF"
  scope = "REGIONAL"
  default_action {
    block {}
  }

   rule {
     name = "empty_query_string"
     priority = 0
     action {
       allow {}
     }
     statement {
       or_statement {
         statement {
           size_constraint_statement {
             field_to_match {
               query_string {}
             }
             comparison_operator = "LT"
             size = 2
             text_transformation {
              priority = 0
              type     = "NONE"
            }
           }
         }
         statement {
           byte_match_statement {
             search_string = "/"
             field_to_match {
               query_string {}
             }
             text_transformation {
              priority = 0
              type     = "NONE"
            }
            positional_constraint = "EXACTLY"
           }
         }
       }
     }
     visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "empty_query_string"
      sampled_requests_enabled   = true
    }
   }

  rule {
    name     = "AWSManagedRulesAmazonIpReputationList"
    priority = 1

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAmazonIpReputationList"
        vendor_name = "AWS"
      }
    }
    

    override_action {
        none {}
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesAmazonIpReputationList-metric"
      sampled_requests_enabled   = true
    }
  }

  rule {
    name     = "AWSManagedRulesPHPRuleSet"
    priority = 2

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesPHPRuleSet"
        vendor_name = "AWS"
      }
    }

    override_action {
        none {}
      }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesPHPRuleSet-metric"
      sampled_requests_enabled   = true
    }
  }

  rule {
    name     = "FalsePositiveBotRule"
    priority = 3

    statement {
      or_statement {
        statement {
          byte_match_statement {
            search_string = "/api/post"
            field_to_match {
              uri_path {}
            }
            text_transformation {
              priority = 0
              type     = "NONE"
            }
            positional_constraint = "CONTAINS"
          }
        }

        statement {
          byte_match_statement {
            search_string = "HeadlessChrome"
            field_to_match {
            single_header {
              name = "user-agent"
               } 
            }
            text_transformation {
              priority = 0
              type     = "NONE"
            }
            positional_constraint = "CONTAINS"
          }
        }
        statement {
          byte_match_statement {
            search_string = "/plaid/webhook"
            field_to_match {
              uri_path {}
            }
            text_transformation {
              priority = 0
              type     = "NONE"
            }
            positional_constraint = "CONTAINS"
          }
        }
        statement {
          byte_match_statement {
            search_string = "/myaccount/"
            field_to_match {
              uri_path {}
            }
            text_transformation {
              priority = 0
              type     = "NONE"
            }
            positional_constraint = "STARTS_WITH"
          }
        }
        statement {
          byte_match_statement {
            search_string = "/cleara/clearaResults"
            field_to_match {
              uri_path {}
            }
            text_transformation {
              priority = 0
              type     = "NONE"
            }
            positional_constraint = "STARTS_WITH"
          }
        }
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "FalsePositiveBotRule-metric"
      sampled_requests_enabled   = true
    }

    action {
      allow {}
    }
  }
}

