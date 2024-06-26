# Generic Variables
region      = "ap-southeast-1"
environment = "dev"
owners      = "hc-lab"


# VPC Variables
name                               = "vpc-terraform" # Overridning the name defined in variable file
cidr                               = "192.168.0.0/16"
azs                                = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
public_subnets                     = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
private_subnets                    = ["192.168.100.0/24", "192.168.101.0/24", "192.168.102.0/24"]
database_subnets                   = ["192.168.200.0/24", "192.168.201.0/24", "192.168.202.0/24"]
create_database_subnet_group       = true
create_database_subnet_route_table = true
enable_nat_gateway                 = true
single_nat_gateway                 = true