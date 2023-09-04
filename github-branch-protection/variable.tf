variable "branch_name" {
  description = "Github branch name"
  type        = string
  default     = "Development"
}

variable "repo_name" {
  type = string
  default = "branch-protection"
}

variable "github_user" {
  type = string
  default = "MahiraTechnology"
}

variable "github_team" {
  type = string
  default = "Mahira team"
  description = "github team"
}