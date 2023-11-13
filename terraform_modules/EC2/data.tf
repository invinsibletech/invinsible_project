data "aws_subnet" "subnet_id" {
  id = var.subnet_id
}

data "aws_vpc" "vpc_id" {
  id = var.vpc_id
}