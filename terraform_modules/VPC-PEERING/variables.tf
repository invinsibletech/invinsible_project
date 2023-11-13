variable "vpc_ids" {
  description = "Your Internet gateway name"
  type = map(string)
  default = {
    vpc1 = "vpc-0160e217a26af753e"
    vpc2 = "vpc-03505f4b8b1e93f4a"
    }
  
}

variable "route_table_ids" {
  description = "This are the route_table ids for the vpcs you want to pair with"
  type = map(string)
  default = {
      vpc1_RT = "rtb-09f4d5f03311024b0"
      vpc2_RT = "rtb-020fd0fe0eb259b98"
    }
  
}


variable "VPC_CIDRS" {
  description = "This are the route_table ids for the vpcs you want to pair with"
  type = map(string)
  default = {
      vpc1_CIDR = "172.0.0.0/24"
      vpc2_CIDR = "10.0.2.0/24"
    }
}

variable "vpc_peering_name" {
  description = "This is the name of your vpc peering connection"
  type = string
}




