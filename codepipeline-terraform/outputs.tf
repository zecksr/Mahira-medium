output "pipeline_arn" {
  value = aws_codepipeline.my_pipeline.arn
}

output "artifact_bucket" {
  value = aws_codepipeline.my_pipeline.artifact_store[0].location
}

# Add any additional outputs as needed