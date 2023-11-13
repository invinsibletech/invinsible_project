resource "aws_vpc_peering_connection" "vpc1-vpc2" {
  # Main VPC ID
  vpc_id = data.aws_vpc.vpc1.id

  # Secondary VPC ID
  peer_vpc_id = data.aws_vpc.vpc2.id

  auto_accept = true        # This only works if both vpcs are in the same account

  tags = {
    "Name" = var.vpc_peering_name
  }
}
