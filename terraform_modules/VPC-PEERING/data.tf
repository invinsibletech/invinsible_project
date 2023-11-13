data "aws_vpc" "vpc1" {
  id = var.vpc_ids["vpc1"]
}


data "aws_vpc" "vpc2" {
  id = var.vpc_ids["vpc2"]
}


data "aws_route_table" "vpc1-RT" {
  route_table_id =  var.route_table_ids["vpc1_RT"]
}


data "aws_route_table" "vpc2-RT" {
  route_table_id =  var.route_table_ids["vpc2_RT"]
}