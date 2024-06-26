output "container_id" {
  value = docker_container.nginx1.id
}

output "image_name" {
  value = docker_image.nginx.name
}