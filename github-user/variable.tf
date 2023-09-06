
#Define a variable for repository name
variable "repository_name" {
   description = "GitHub repository name"
   type       = string
   default    = "Mahira-repo"
}

# Define a variable for collaborator username(user ID)

variable "collaborator_usernames" {
  type    = list(string)
  description = "GitHub collaborator username(user ID)"
  default = ["user1", "user2"]
}

variable "permissions" {
  type = list(string)
  description = "a list for permissions for the github user"
  default = [ "pull", "push" ]
}