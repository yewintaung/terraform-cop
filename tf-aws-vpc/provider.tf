terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.50.0"
    }
  }

  backend "s3" {
    bucket         	    = "tf-aws-vpc-backend-statefile"
    key              	= "terraform/state/terraform.tfstate"
    region         	    = "ap-southeast-1"
    encrypt        	    = true
    dynamodb_table      = "tf-aws-vpc-backend-statefile-lock"
  }
}

provider "aws" {
  region                   = "ap-southeast-1"
  shared_config_files      = ["~/.aws/credentials"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "default"
  alias                    = "default"
}