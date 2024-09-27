output "paths" {
  value = data.vault_auth_backends.auth_list.paths
}

output "role_name" {
  value = vault_aws_secret_backend_role.vpc_role.name
}

output "dev_role_access_key" {
  value     = data.vault_aws_access_credentials.vpc_role_creds.access_key
  sensitive = true
}

output "dev_role_secret_key" {
  value     = data.vault_aws_access_credentials.vpc_role_creds.secret_key
  sensitive = true
}