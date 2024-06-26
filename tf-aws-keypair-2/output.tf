# EC2 Complete
output "keypair-id" {
  value       = aws_key_pair.ec2_key.id
}

output "keypair-arn" {
  value       = aws_key_pair.ec2_key.arn
}

output "keypair-key_name" {
  value       = aws_key_pair.ec2_key.key_name
}

output "keypair-key_type" {
  value       = aws_key_pair.ec2_key.key_type
}

output "keypair-key_pair_id" {
  value       = aws_key_pair.ec2_key.key_pair_id
}

output "keypair-key_pair_fingerprint" {
  value       = aws_key_pair.ec2_key.fingerprint
}