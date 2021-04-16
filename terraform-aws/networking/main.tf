## --- networking/main.tf ---

resource "random_integer" "random" {
  min = 1
  max = 100
}


resource "aws_vpc" "mtc_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "mtc_vpc-${random_integer.random.id}"
  }
}


resource "aws_subnet" "mtc_public_subnet" {
  count                   = length(var.public_cidrs)
  cidr_block              = var.public_cidrs[count.index]
  vpc_id                  = aws_vpc.mtc_vpc.id
  map_public_ip_on_launch = true
  availability_zone = [
    "eu-west-2a",
    "eu-west-2b",
    "eu-west-2c",
  ][count.index]

  tags = {
    Name = "mtc-public_${count.index + 1}"
  }
}