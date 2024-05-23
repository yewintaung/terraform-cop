data "aws_vpc" "default_vpc" {
  provider  = aws.default
  default   = true
}

data "aws_subnet" "default_subnet-AZ-1" {
  provider          = aws.default
  vpc_id            = data.aws_vpc.default_vpc.id
  default_for_az    = true
  availability_zone = "ap-southeast-1a"
}