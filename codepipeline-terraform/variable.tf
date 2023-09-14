variable "pipeline_name" {
  description = "Name of the CodePipeline"
  type        = string
}

variable "source_repository" {
  description = "URL of the source code repository"
  type        = string
}

variable "buildspec_file" {
  description = "File path to the buildspec file"
  type        = string
}

# Add any additional variables as needed