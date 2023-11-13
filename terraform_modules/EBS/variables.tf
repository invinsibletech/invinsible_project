
variable "AZ" {
  description = "your availability zone "
  type = string
  }
  


variable "EBS_type" {
    description = "The type of of EBS volume"
    type = list(string)
    default = [ "standard", "gp2", "gp3", "io1", "io2", "sc1", "st1" ]
  
}


variable "ebs_name" {
  description = "EBS volume tag_name"
  type = string
}


variable "inst_id" {
  description = "instance id"
  type = string
}

variable "Dev_name" {
  description = "Device name for the root volumes"
  type = string
}

variable "vol_id" {
  description = "volume id"
  type = string
}
