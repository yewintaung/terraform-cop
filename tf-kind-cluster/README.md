# Terraform AWS backend type as S3

> [!NOTE]
> AWS Provider using kind + helm + kubernetes. <br>
> kind as kubernetes cluster <br>
> helm is used to install metallb <br>
> kubernetes is used to apply metallb_ipaddresspool segment
```
terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.5.1"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.31.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.14.0"
    }
  }
}
```
