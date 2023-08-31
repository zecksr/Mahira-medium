resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = var.dashboard_name
  dashboard_body = <<EOF
  {
    "widgets" : [
      {
        "type": "metric",
        "x": 0,
        "y": 0,
        "width": 12,
        "height": 6,
        "properties": {
          "metrics": [
            ["AWS/EC2", 
            "CPUUtilization", 
            "InstanceId", 
            "${var.instance_id}"
            ]
          ],
          "period": 300,
          "stat": "Average",
          "region": "${var.region}",
          "title": "EC2 Instance CPU"
        }
      },
      {
        "type": "metric",
        "x": 0,
        "y": 10,
        "width": 12,
        "height": 6,
        "properties": {
          "metrics": [
            ["AWS/EC2", "NetworkIn", 
            "InstanceId", 
            "${var.instance_id}"
            ]
          ],
          "period": 300,
          "stat": "Average",
          "region": "${var.region}",
          "title": "EC2 Instance Network In"
        }
      },
      {
        "type": "metric",
        "x": 0,
        "y": 16,
        "width": 12,
        "height": 6,
        "properties": {
          "metrics": [
            ["AWS/EC2", 
            "NetworkOut", 
            "InstanceId", 
            "${var.instance_id}"
            ]
          ],
          "period": 300,
          "stat": "Average",
          "region": "${var.region}",
          "title": "EC2 Instance Network Out"
        }
      },
      {
        "type": "metric",
        "x": 0,
        "y": 22,
        "width": 12,
        "height": 6,
        "properties": {
          "metrics": [
            ["AWS/EC2", 
            "DiskReadBytes", 
            "InstanceId", 
            "${var.instance_id}"],
            ["AWS/EC2", 
            "DiskWriteBytes", 
            "InstanceId", 
            "${var.instance_id}"
            ]
          ],
          "period": 300,
          "stat": "Average",
          "region": "${var.region}",
          "title": "EC2 Instance Disk IO"
        }
      }
    ]
  }
EOF
}