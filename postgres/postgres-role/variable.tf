variable "db_username" {
  type = string
  default = "read_only_user"
}

variable "secret_name" {
  type = string
  default = "Open-source"
}

# Note:- Login to aws management console, then navigate to secrets manager service and find the Open-source secret. Retrieve the secret values in Open-source secret to copy the master_password & db_read_only_password.
variable "db_master_password" {
  type        = string
  description = "The master pasword of the postgres-db"
  default = ""
}

variable "db_read_only_password" {
  type        = string
  description = "read only password of the postgres-db"
  default = ""
}
