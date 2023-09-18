
resource "aws_secretsmanager_secret" "my_secret" {
  name = var.secret_name
}

resource "aws_secretsmanager_secret_version" "my_secret_version" {
  secret_id     = aws_secretsmanager_secret.my_secret.id
  secret_string = var.secret_value
}
