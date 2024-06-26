terraform {
  cloud {
    organization = "cohort7"

    workspaces {
      name = "ec2-module-test"
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
}