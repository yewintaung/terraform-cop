locals {

  owners      = var.owners
  environment = var.environment
  name        = "${local.owners}-${local.environment}"

  region = var.region

  user_data = <<-EOT
    #!/bin/bash
    echo "Hello Terraform!"
  EOT

  tags = {
    owners      = local.owners
    environment = local.environment
  }
}