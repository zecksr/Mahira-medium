resource "github_team" "mahira_team" {
  count = length(var.team_names)
  name  = var.team_names[count.index]
}