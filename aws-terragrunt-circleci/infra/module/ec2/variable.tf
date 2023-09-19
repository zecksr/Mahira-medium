variable "ami-id" {
  description = "This variable is used to define ami id"
  default     = "ami-123456789"
}

variable "instance-type" {
  type    = string
  default = "t2.micro"
}
