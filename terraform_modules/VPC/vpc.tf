resource "aws_vpc" "vpc" {
    cidr_block = var.VPC-CIDR
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
        "Name" = var.vpc_name
    }
  
}