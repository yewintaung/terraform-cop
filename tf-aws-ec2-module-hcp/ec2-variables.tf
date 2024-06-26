variable "instance_type" {
  description = "Instance Type"
  type        = string
  default     = "t2.micro"
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
  default     = "ap-southeast-1a"
}

variable "subnet_id" {
  description = "Subnet Id"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = ""
}

variable "owners" {
  description = "organization this Infrastructure belongs"
  type        = string
  default     = ""
}

variable "region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = ""
}