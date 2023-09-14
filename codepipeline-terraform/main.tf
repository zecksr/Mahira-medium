provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}

resource "aws_codepipeline" "my_pipeline" {
  name     = var.pipeline_name
  role_arn = "arn:aws:iam::123456789012:role/CodePipelineServiceRole"  # Replace with your pipeline service role ARN

  artifact_store {
    location = "my-pipeline-artifacts"  # Replace with your desired S3 bucket name
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "SourceAction"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["SourceArtifact"]

      configuration {
        RepositoryName = var.source_repository
      }
    }
  }

  stage {
    name = "Build"

    action {
      name            = "BuildAction"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["SourceArtifact"]
      version         = "1"

      configuration {
        ProjectName    = "my-codebuild-project"  # Replace with your CodeBuild project name
        EnvironmentVariables = [
          {
            name  = "BUILD_SPEC"
            value = var.buildspec_file
          }
        ]
      }
    }
  }

  # Add additional stages and actions as needed
}

# Add any additional resources as needed