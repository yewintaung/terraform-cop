# Terraform AWS backend type as S3

> [!NOTE]
> Kubernetes Provider using postgre as backend statefile type. <br>
> Statefile will be stored in postgre DB, which is supporting locking by default. <br>
```
terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
  backend "pg" {
    conn_str = "postgres://username:password@db_hostname/db_name?sslmode=disable"
  }
}

provider "kubernetes" {
  host = var.host

  client_certificate     = base64decode(var.client_certificate)
  client_key             = base64decode(var.client_key)
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
}
```
