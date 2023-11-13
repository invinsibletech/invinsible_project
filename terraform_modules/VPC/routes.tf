# Public  Table

resource "aws_route_table" "pub_RT" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.IG.id
    }

    tags = {
      "Name" = var.pub-route-name
    }
  
}

# Private Route Table

resource "aws_route_table" "priv_RT" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.NAT.id
    }
    tags = {
      "Name" = var.priv-route-name
    }
}