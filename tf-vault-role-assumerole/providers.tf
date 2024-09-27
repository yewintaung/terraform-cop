terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "4.4.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.69.0"
    }
  }
}

provider "vault" {
  # Configuration options
  # set required value in env variable
  # export VAULT_ADDR=http://127.0.0.1:8200
  # export VAULT_TOKEN=[token here]
}

