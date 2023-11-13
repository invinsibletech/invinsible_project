variable "token" {
  description = "The efs creation_token"
  type = string
}

variable "efs_name"{
    description = "Your EFS name"
    type = string
}

variable "subnet_id" {
  description = "Your subnet id"
  type = map(string)
  default = {
    "priv_subnet" = "subnet-00a53e0f73777b4f7"
    "pub_subnet" = "subnet-06b44e261f30bb91c"
  }  
}

/*
variable "SG_name" {
  description = "Mount Target security group name"
  type = string
}

variable "ingressrules" {
description = "The Ingressrules of our mount target security_group"
type = list(string)
default = [ "22" , "2049"]

}

variable "vpc_id" {
  description = "VPC id for your mount target security group"
  type = string
}

*/