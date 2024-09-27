
provider "aws" {
  access_key = data.vault_aws_access_credentials.vpc_role_creds.access_key
  secret_key = data.vault_aws_access_credentials.vpc_role_creds.secret_key
}


data "vault_aws_access_credentials" "vpc_role_creds" {
  role    = "vpc_role"
  backend = "aws"
  type    = "creds"
}

resource "aws_vpc" "main" {
  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "custom_vpc_using_vault_role_iamuser"
  }
}