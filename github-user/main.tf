#main.tf
resource "github_repository_collaborator" "mahira" {
  for_each = { for username in var.collaborator_usernames : username => username }
  count      = length(var.permissions)

  repository = var.repository_name
  username   = each.value
  permission = var.permissions[count.index]
}