variable "kind_cluster_name" {
  type        = string
  description = "Cluster Name"
  default     = "demo-local"
}

variable "kind_cluster_node_image" {
  type        = string
  description = "Node image version"
  default     = "kindest/node:v1.23.17"
}

variable "kind_cluster_config_path" {
  type        = string
  description = ".kube/config file path"
  default     = "~/.kube/config"
}

variable "metallb_namespace" {
  type        = string
  description = "metallb namespace name"
  default     = "metallb-system"
}

variable "metallb_ipaddresspool" {
  type        = string
  description = "IP address pool"
  default     = "172.18.255.150-172.18.255.169"
}