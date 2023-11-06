#main.tf
data "github_repository" "repository" {
  full_name = var.repository
}

data "github_branch" "development" {
  repository = var.repository
  branch     = var.branch
}
resource "null_resource" "github_topics" {
  triggers = {
    repo_name = "${data.github_repository.repository.full_name}"
  }

  provisioner "local-exec" {
    command = <<-EOT
      GITHUB_TOKEN="${var.token}"
      REPO_NAME="${data.github_repository.repository.full_name}"

    curl -X PUT \
      -H "Authorization: token $GITHUB_TOKEN" \
      -H "Accept: application/vnd.github.mercy-preview+json" \
      -d '{
        "names": ["terraform", "infrastructure-as-code", "circleci", "aws", "kubernetes","argo", "cognito", "vcluster", "kubecost", "kyverno", "kubescape"]
      }' \
      "https://api.github.com/repos/$REPO_NAME/topics"
    EOT
  }
}