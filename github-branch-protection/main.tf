resource "github_branch_protection" "github_branch_protection" {
  repository_id = github_repository.mahira_github.node_id

  pattern          = "main"
  enforce_admins   = true
  allows_deletions = true

  required_status_checks {
    strict   = false
    contexts = ["ci/travis"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews  = true
    restrict_dismissals    = true
    dismissal_restrictions = [
      data.github_user.mahira_user.node_id,
      github_team.github_team.node_id,
      "/MahiraTechnology",
      "MahiraTechnology/Mahira team",
    ]
  }

  push_restrictions = [
    data.github_user.mahira_user.node_id,
    "/MahiraTechnology",
    "MahiraTechnology/Mahira team",
    # limited to a list of one type of restriction (user, team, app)
    # github_team.example.node_id
  ]

  force_push_bypassers = [
    data.github_user.mahira_user.node_id,
    "/MahiraTechnology",
    "MahiraTechnology/Mahira team",
    # limited to a list of one type of restriction (user, team, app)
    # github_team.example.node_id
  ]

}

resource "github_repository" "mahira_github" {
  name = var.repo_name
}

data "github_user" "mahira_user" {
  username = var.github_user
}

resource "github_team" "github_team" {
  name = var.github_team
}

resource "github_team_repository" "team_repository" {
  team_id    = github_team.github_team.id
  repository = github_repository.mahira_github.name
  permission = "pull"
}

