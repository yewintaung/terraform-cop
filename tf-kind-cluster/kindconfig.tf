
provider "kind" {
}

provider "kubernetes" {
  config_path = pathexpand(var.kind_cluster_config_path)
}

resource "kind_cluster" "default" {
  name            = var.kind_cluster_name
  node_image      = var.kind_cluster_node_image
  kubeconfig_path = pathexpand(var.kind_cluster_config_path)
  wait_for_ready  = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"

    }

    node {
      role = "worker"
    }

    node {
      role = "worker"
    }

    node {
      role = "worker"
    }
  }
}