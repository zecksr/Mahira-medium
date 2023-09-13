output "secret_arn" {
  value = aws_secretsmanager_secret.my_secret.arn
}
# Add any additional outputs as needed