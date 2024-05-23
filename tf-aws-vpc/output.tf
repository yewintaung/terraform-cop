output "default-vpc-output" {
  value = data.aws_vpc.default_vpc
}

output "default-subnet-AZ-1" {
  value = data.aws_subnet.default_subnet-AZ-1
}