variable "secret_name" {
  description = "Name of the secret"
  type        = string
  default     = "demo-secret"
}
variable "secret_value" {
  description = "Value of the secret"
  type        = string
  secret_string = <<EOF
   {"username": "${var.username}","password": "${var.password}"}
  EOF
}