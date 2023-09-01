variable "eks_cluster_name" {
  type = string
  default = "YOUR EKS CLUSTER NAME"
  description = "Name of the Eks cluster"
}

variable "region" {
  type = string
  default = "us-east-1"
  description = "The region in which eks cluster exists"
}