variable "github_token" {
  default = "YOUR GITHUB TOKEN"
}

variable "team_names" {
  type = list(string)
  default = [
    "devoloper",
    "tester",
    "designer",
  ]
}