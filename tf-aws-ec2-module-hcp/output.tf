# EC2 Complete
output "ec2_instance_id" {
  description = "The ID of the instance"
  value       = module.ec2-instance.id
}