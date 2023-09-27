terraform {
  source = "tfr:///terraform-aws-modules/alb/aws?version=8.1.0"
}

locals {
  region            = "us-east-1" 
  backend_protocol   = "HTTP"
  backend_port       = "80"
  target_type        = "instance"
  vpc_id             = "vpc-id"
  subnet_ids         = ["subnet-ids"]
  security_group_id  = ["security-group Id"]
}

inputs = {
  name               = "Mahira-alb"
  load_balancer_type = "application"
  vpc_id             = local.vpc_id
  subnets            = [local.subnet_ids]
  security_groups    = [local.security_group_id]
  idle_timeout       = 4000

  target_groups = [
    {
      name              = "alb-tg"
      backend_protocol = local.backend_protocol
      backend_port     = local.backend_port
      target_type      = local.target_type
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/health.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
    }
  ]
}