output "vpc_role_access_key" {
  value     = data.vault_aws_access_credentials.vpc_role_creds.access_key
  sensitive = true
}

output "vpc_role_secret_key" {
  value     = data.vault_aws_access_credentials.vpc_role_creds.secret_key
  sensitive = true
}