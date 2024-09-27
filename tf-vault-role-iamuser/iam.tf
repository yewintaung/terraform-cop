resource "aws_iam_user" "vault_admin" {
  name = "vault-admin"
  path = "/"
  force_destroy = true

  tags = {
    Name = "vault-admin"
  }
}

resource "aws_iam_access_key" "vault_admin_access_key" {
  user = aws_iam_user.vault_admin.name
}

data "aws_iam_policy_document" "vault_admin_policy" {
  statement {
    effect = "Allow"
    actions = [
      "iam:AttachUserPolicy",
      "iam:CreateUser",
      "iam:CreateAccessKey",
      "iam:DeleteUser",
      "iam:DeleteAccessKey",
      "iam:DeleteUserPolicy",
      "iam:DetachUserPolicy",
      "iam:GetUser",
      "iam:ListAccessKeys",
      "iam:ListAttachedUserPolicies",
      "iam:ListGroupsForUser",
      "iam:ListUserPolicies",
      "iam:PutUserPolicy",
      "iam:AddUserToGroup",
      "iam:RemoveUserFromGroup"
    ]
    resources = [
      "arn:aws:iam::205930650628:user/vault-*"
    ]
  }
}

resource "aws_iam_user_policy" "vault_admin_policy_attach" {
  name   = "vault_admin_policy"
  user   = aws_iam_user.vault_admin.name
  policy = data.aws_iam_policy_document.vault_admin_policy.json
}