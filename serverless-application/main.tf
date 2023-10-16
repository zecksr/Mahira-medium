# Create an S3 bucket for storing application artifacts
resource "aws_s3_bucket" "app_repository" {
  bucket = "serverless-app-repository"
}
# Define IAM roles and policies
resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"
  assume_role_policy = jsonencode({
  Version = "2012-10-17",
   Statement = [
   {
      Action = "sts:AssumeRole",
      Effect = "Allow",
       Principal = {
       Service = "lambda.amazonaws.com"
      }
     }
    ]
  })
}
# Define IAM policy for Lambda function
resource "aws_iam_policy" "lambda_policy" {
  name = "lambda_policy"
  description = "Policy for Lambda functions in the repository"
  policy = jsonencode({
   Version = "2012-10-17",
    Statement = [
     {
      Action = [  
          "lambda:InvokeFunction",
      ],
      Effect = "Allow",
      Resource = "*",
      },
    ],
  })
}
# Attach managed policies to the Lambda execution role
resource "aws_iam_policy_attachment" "lambda_role_policy_attachment" {
  name = "lambda-policy-attachment"
  policy_arn = aws_iam_policy.lambda_policy.arn
  roles = [aws_iam_role.lambda_role.name]
}
# Attach AWSLambdaBasicExecutionRole managed policy
resource "aws_iam_policy_attachment" "lambda_basic_execution_attachment" {
  name = "lambda-basic-execution-policy-attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  roles = [aws_iam_role.lambda_role.name]
}
# Define IAM policy for CloudWatch Logs
resource "aws_iam_policy" "cloudwatch_logs_policy" {
  name = "cloudwatch_logs_policy"
  description = "Policy for CloudWatch Logs access"
  policy = jsonencode({
   Version = "2012-10-17",
    Statement = [
    {
     Action = [
       "logs:CreateLogGroup",
       "logs:CreateLogStream",
       "logs:PutLogEvents",
       "logs:DescribeLogStreams",
      ],
     Effect = "Allow",
     Resource = "*",
    },
    ],
  })
}
# Attach CloudWatch Logs policy to the Lambda execution role
resource "aws_iam_policy_attachment" "cloudwatch_logs_attachment" {
  name = "cloudwatch-logs-policy-attachment"
  policy_arn = aws_iam_policy.cloudwatch_logs_policy.arn
  roles = [aws_iam_role.lambda_role.name]
}
# Define IAM policy for S3 full access
resource "aws_iam_policy" "s3_full_access_policy" {
  name = "s3-full-access-policy"
  description = "Policy for S3 full access"
  policy = jsonencode({
   Version = "2012-10-17",
   Statement = [
    {
     Action = [
            "s3:*",
       ],
     Effect = "Allow",
     Resource = "*",
    },
    ],
  })
 }
# Attach S3 full access policy to the Lambda execution role
resource "aws_iam_policy_attachment" "s3_full_access_attachment" {
  name = "s3-full-access-policy-attachment"
  policy_arn = aws_iam_policy.s3_full_access_policy.arn
  roles = [aws_iam_role.lambda_role.name]
}
# Define AWS Lambda function
resource "aws_lambda_function" "list_applications" {
  filename = "list_applications.zip" 
  function_name = "newFunctionName" 
  role = aws_iam_role.lambda_role.arn
  handler = "list_applications.list_applications" 
  runtime = "python3.8" 
  source_code_hash = filebase64sha256("list_applications.zip") 
}
# Create an AWS API Gateway for your repository
resource "aws_api_gateway_rest_api" "repository_api" {  
  name = "repository_api"
  description = "Serverless Application Repository API"
}

resource "aws_api_gateway_resource" "repository_resource" {
  rest_api_id = aws_api_gateway_rest_api.repository_api.id
  parent_id = aws_api_gateway_rest_api.repository_api.root_resource_id
  path_part = "v1"
}