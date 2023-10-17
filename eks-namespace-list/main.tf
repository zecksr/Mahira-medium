data "aws_eks_cluster" "default" {
  name = var.eks_cluster_name
}

data "aws_eks_cluster_auth" "default" {
  name = var.eks_cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.default.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.default.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.default.token
}

resource "kubernetes_manifest" "eks_namespaces_role" {
  manifest = {
    apiVersion = "rbac.authorization.k8s.io/v1",
    kind =       "ClusterRole",
    metadata = {
      name = "namespaces-list-role"
    },
    rules = [
      {
        apiGroups = [""],
        resources = ["namespaces"],
        verbs =     ["get", "list"]
      }
    ]
  }
}

resource "kubernetes_manifest" "eks_rolebinding_cluster_namespace_list" {
  manifest = {
    apiVersion = "rbac.authorization.k8s.io/v1",
    kind =       "ClusterRoleBinding",
    metadata = {
      name = "cluster-namespace-list-binding"
    },
    roleRef = {
      apiGroup = "rbac.authorization.k8s.io",
      kind     = "ClusterRole",
      name     = "${kubernetes_manifest.eks_namespaces_role.manifest.metadata.name}"
    },
    subjects = [
      {
        kind      = "Group",
        apiGroup  = "rbac.authorization.k8s.io",
        name      = "aws-${var.env_name}-eks"
      }
    ]
  }
}