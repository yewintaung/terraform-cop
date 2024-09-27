resource "vault_aws_secret_backend" "aws_secret_backend" {
  path       = "aws"
  access_key = aws_iam_access_key.secrets_engine_credentials.id
  secret_key = aws_iam_access_key.secrets_engine_credentials.secret

  default_lease_ttl_seconds = 420
  max_lease_ttl_seconds     = 1800
}

resource "vault_aws_secret_backend_role" "aws_secret_backend_role" {
  backend         = vault_aws_secret_backend.aws_secret_backend.path
  name            = "vpc_role"
  credential_type = "assumed_role"
  role_arns       = [aws_iam_role.tfc_role.arn]
  default_sts_ttl = 360
}

resource "time_sleep" "wait_before_fetching_creds" {
  depends_on      = [vault_aws_secret_backend_role.aws_secret_backend_role]
  create_duration = "10s"
}

data "vault_aws_access_credentials" "vpc_role_creds" {
  depends_on = [time_sleep.wait_before_fetching_creds]
  role       = vault_aws_secret_backend_role.aws_secret_backend_role.name
  backend    = vault_aws_secret_backend.aws_secret_backend.path
  type       = "sts"
  ttl        = 900
}