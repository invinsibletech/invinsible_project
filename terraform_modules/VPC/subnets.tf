# Private Subnet

resource "aws_subnet" "priv-subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.priv-sub-CIDR
    availability_zone_id = var.AZ[""]

    tags = {
      "Name" = var.priv-sub-name
    }
  
}

# Public Subnet

resource "aws_subnet" "pub-subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.pub-sub-CIDR
    availability_zone = var.AZ[""]
    map_public_ip_on_launch = true #This is what makes it a public subnet

    tags = {
      "Name" = var.pub-sub-name
    }
  
}