resource "null_resource" "eks_cluster_upgrade" {
  provisioner "local-exec" {
    command = "aws eks update-cluster-version --region ${var.region} --name ${var.eks_cluster_name} --kubernetes-version <EKS LATEST VERSION>"
  }
}