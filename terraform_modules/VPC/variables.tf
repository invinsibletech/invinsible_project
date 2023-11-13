variable "VPC-CIDR" {
  description = "The CIDR block for your VPC"
  type = number
}

variable "priv-sub-CIDR" {
  description = "The CIDR block for your VPC private subnet "
  type = number
}

variable "AZ" {
    description = "your availability zone "
    type = map(string)
    default = {
      "zone1" = ""
      "zone2" = ""
      "zone3" = ""
    }
  
}


variable "pub-sub-CIDR" {
  description = "The CIDR block for your VPC private subnet "
  type = number
}

variable "vpc_name" {
  description = "The VPC Tag name"
  type = string
}

variable "pub-sub-name" {
  description = "The name of your public subnet"
  type = string
}

variable "priv-sub-name" {
  description = "The name of your private subnet"
  type = string
}

variable "priv-route-name" {
  description = "The name of your route table"
  type = string
}


variable "pub-route-name" {
  description = "The name of your route table"
  type = string
}

variable "Nat_gateway_name" {
  description = "The tag_name of your nat_gateway"
  type = string
}

variable "IG_name" {
  description = "Your Internet gateway name"
  type = string
}


variable "vpc_ids" {
  description = "Your Internet gateway name"
  type = map(string)
  default = [
    {
      vpc1 = "vpc-0160e217a26af753e"
      vpc2 = "vpc-03505f4b8b1e93f4a"
    }
  ]
}

variable "route_table_ids" {
  description = "This are the route_table ids for the vpcs you want to pair with"
  type = map(string)
  default = [
    {
      vpc1_RT = "rtb-09f4d5f03311024b0"
      vpc2_RT = "rtb-020fd0fe0eb259b98"
    }
  ]
}


variable "VPC_CIDRS" {
  description = "This are the route_table ids for the vpcs you want to pair with"
  type = map(string)
  default = [
    {
      vpc1_CIDR = "172.0.0.0/24"
      vpc2_CIDR = "10.0.2.0/24"
    }
  ]
}





