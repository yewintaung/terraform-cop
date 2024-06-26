terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.55.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2-key"
  public_key = file("~/terraform-cop/tf-aws-keypair/ssh-key/ec2_rsa.pub")
}