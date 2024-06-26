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