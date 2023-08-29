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

resource "kubernetes_manifest" "namespace_read_only_access" {
  manifest = {
    apiVersion = "rbac.authorization.k8s.io/v1"
    kind =       "ClusterRole"
    metadata = {
      name = "namespace-read_only-role"
    },
    rules = [
      {
        apiGroups = [""],
        resources = ["pods", "services", "configmaps", "secrets", "replicationcontrollers"]
        verbs =     ["get", "list"]
      },
      {
        apiGroups = ["batch"]
        resources = ["jobs", "cronjobs"]
        verbs = ["get", "list"]
      },
      {
        apiGroups = ["apps"],
        resources = ["daemonsets", "deployments", "replicasets", "statefulsets"]
        verbs = ["get", "list"]
      },
      {
        apiGroups = ["autoscaling"]
        resources = ["horizontalpodautoscalers"]
        verbs = ["get", "list"]
      },
      {
        apiGroups = ["argoproj.io"]
        resources = ["workflows"]
        verbs = ["get", "list"]
      }
    ]
  }
}

resource "kubernetes_manifest" "rolebinding_namespace_read-onlyaccess" {
  manifest = {
    apiVersion = "rbac.authorization.k8s.io/v1"
    kind =       "RoleBinding"
    metadata = {
      name = "namespace-read_only-role_binding"
      namespace = "argocd"
    },
    roleRef = {
      apiGroup = "rbac.authorization.k8s.io"
      kind     = "ClusterRole"
      name     = "${kubernetes_manifest.namespace_read_only_access.manifest.metadata.name}"
    },
    subjects = [
      {
        kind      = "Group"
        apiGroup  = "rbac.authorization.k8s.io"
        name      = "aws-eks-users"
      }
    ]
  }
}