output "teams_id" {
  value = [for i in github_team.mahira_team : i.id]
}