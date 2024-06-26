provider "helm" {
  kubernetes {
    config_path = pathexpand(var.kind_cluster_config_path)
  }
}

resource "helm_release" "metallb" {
  name             = "metallb"
  repository       = "https://metallb.github.io/metallb"
  chart            = "metallb"
  version          = "0.14.5"
  namespace        = var.metallb_namespace
  create_namespace = true
  depends_on       = [kind_cluster.default]
}

resource "terraform_data" "wait_for_metallb_controller" {
  triggers_replace = uuid()

  provisioner "local-exec" {
    command = <<EOF
      printf "\n⏳ Waiting for the metallb controller pod to be running...\n"
      kubectl wait --namespace ${helm_release.metallb.namespace} \
        --for=jsonpath='{.status.phase}'=Running pod \
        --selector=app.kubernetes.io/component=controller \
        --timeout=120s
    EOF
  }

  depends_on = [helm_release.metallb]
}

resource "terraform_data" "wait_for_metallb_speaker" {
  triggers_replace = uuid()

  provisioner "local-exec" {
    command = <<EOF
      printf "\n⏳ Waiting for the metallb speaker pod to be running...\n"
      kubectl wait --namespace ${helm_release.metallb.namespace} \
        --for=jsonpath='{.status.phase}'=Running pod \
        --selector=app.kubernetes.io/component=speaker \
        --timeout=120s
    EOF
  }

  depends_on = [terraform_data.wait_for_metallb_controller]
}

resource "kubernetes_manifest" "ip_address_pool" {
  manifest = {
    apiVersion = "metallb.io/v1beta1"
    kind       = "IPAddressPool"
    metadata = {
      name      = "example"
      namespace = var.metallb_namespace
    }
    spec = {
      addresses = [var.metallb_ipaddresspool]
    }
  }

  depends_on = [terraform_data.wait_for_metallb_speaker]
}

resource "kubernetes_manifest" "l2_advertisement" {
  manifest = {
    apiVersion = "metallb.io/v1beta1"
    kind       = "L2Advertisement"
    metadata = {
      name      = "empty"
      namespace = var.metallb_namespace
    }
  }
  depends_on = [kubernetes_manifest.ip_address_pool]
}

