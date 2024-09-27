
provider "aws" {
  access_key = data.vault_aws_access_credentials.vpc_role_creds.access_key
  secret_key = data.vault_aws_access_credentials.vpc_role_creds.secret_key
  token      = data.vault_aws_access_credentials.vpc_role_creds.security_token
}


data "vault_aws_access_credentials" "vpc_role_creds" {
  role    = "vpc_role"
  backend = "aws"
  type    = "sts"
  ttl     = 900
}

resource "aws_vpc" "main" {
  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "custom_vpc"
  }
}