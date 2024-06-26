terraform {
  cloud {
    organization = "cohort7"

    workspaces {
      name = "vpc-module-test"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.50.0"
    }
  }
}

provider "aws" {
  region = var.region
  #   profile = "default" #AWS Credentials Profile (profile = "default") configured on local
  #   access_key = var.aws_access_key
  #   secret_key = var.aws_secret_key
  # shared_config_files      = ["~/.aws/credentials"]
  # shared_credentials_files = ["~/.aws/credentials"]
  # profile                  = "default"
  # alias                    = "default"
}