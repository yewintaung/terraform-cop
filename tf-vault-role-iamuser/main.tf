data "vault_auth_backends" "auth_list" {}

resource "vault_aws_secret_backend" "aws" {
  # administrator accessclea
  access_key                = aws_iam_access_key.vault_admin_access_key.id
  secret_key                = aws_iam_access_key.vault_admin_access_key.secret
  region                    = "ap-southeast-1"
  default_lease_ttl_seconds = 300
  max_lease_ttl_seconds     = 3600
}

resource "vault_aws_secret_backend_role" "vpc_role" {
  backend         = vault_aws_secret_backend.aws.path
  name            = "vpc_role"
  credential_type = "iam_user"
  policy_arns     = ["arn:aws:iam::aws:policy/AdministratorAccess"]
}

data "vault_aws_access_credentials" "vpc_role_creds" {
  backend = vault_aws_secret_backend.aws.path
  role    = vault_aws_secret_backend_role.vpc_role.name
}