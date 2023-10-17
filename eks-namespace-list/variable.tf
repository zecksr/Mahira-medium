variable "eks_cluster_name" {
  description = "cluster name of eks"
  type = string
  default = "eks-cluster"
}

variable "env_name" {
  type        = string
  description = "Type of environment ex: dev, stage or prod"
  default     = "dev"
}