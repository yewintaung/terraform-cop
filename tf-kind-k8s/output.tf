output "nginx_deployment_output" {
  value = kubernetes_deployment.nginx.metadata
}