resource "aws_iam_user" "mahira_user" {
  name = var.user_name
}
resource "aws_iam_group" "mahira_group" {
  name = var.group_name
}
resource "aws_iam_group_membership" "group_membership" {
  name  = "user-group_membership"
  users = [
          aws_iam_user.mahira_user.name
         ]
  group = aws_iam_group.mahira_group.name
}
resource "aws_iam_policy" "policy" {
  name = "user_policy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowViewAccountInfo",
        "Effect" : "Allow",
        "Action" : [
          "iam:GetAccountPasswordPolicy",
          "iam:GetAccountSummary"
        ],
        "Resource" : "*"
      },
      {
        "Sid" : "AllowManageOwnPasswords",
        "Effect" : "Allow",
        "Action" : [
          "iam:ChangePassword",
          "iam:GetUser"
        ],
        "Resource" : "arn:aws:iam::*:user/$${aws:username}"
      },
      {
        "Sid" : "AllowManageOwnAccessKeys",
        "Effect" = "Allow",
        "Action" : [
          "iam:CreateAccessKey",
          "iam:DeleteAccessKey",
          "iam:ListAccessKeys",
          "iam:UpdateAccessKey"
        ],
        "Resource" : "arn:aws:iam::*:user/$${aws:username}"
      },
      {
        "Sid" : "AllowManageOwnSSHPublicKeys",
        "Effect" : "Allow",
        "Action" : [
          "iam:DeleteSSHPublicKey",
          "iam:GetSSHPublicKey",
          "iam:ListSSHPublicKeys",
          "iam:UpdateSSHPublicKey",
          "iam:UploadSSHPublicKey"
        ],
        "Resource" : "arn:aws:iam::*:user/$${aws:username}"
      }
    ]
  })
}
resource "aws_iam_policy_attachment" "policy_attachment" {
  policy_arn = aws_iam_policy.policy.arn
  groups     = [aws_iam_group.mahira_group.name]
  name       = "group-policy-attachment"
}


resource "aws_iam_account_password_policy" "password_policy" {
  minimum_password_length        = 08
  require_lowercase_characters   = true
  require_uppercase_characters   = true
  require_numbers                = false
  require_symbols                = true
  allow_users_to_change_password = true
}