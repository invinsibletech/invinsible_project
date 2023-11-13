resource "aws_route" "vpc1-route" {
  route_table_id = data.aws_route_table.vpc1-RT.id
  destination_cidr_block =   var.VPC_CIDRS["vpc2_CIDR"]                                    # IP address range of vpc2
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc1-vpc2.id
}


resource "aws_route" "vpc2-route" {
  route_table_id = data.aws_route_table.vpc2-RT.id
  destination_cidr_block =  var.VPC_CIDRS["vpc1_CIDR"]                                 # IP address range of vpc1
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc1-vpc2.id
}