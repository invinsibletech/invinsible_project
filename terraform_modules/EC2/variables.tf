variable "ami_id" {
  description = "My instance ami"
  type = string
}

variable "instance_type" {
    description = "instance type"
    type = string
  
}
 
variable "key_name" {
  type = string
  description = "The name of the key that you are passing in the pub.tf file"
}

/*
variable "AZ" {
  description = "availability zone of my instance"
  type = map(string)

}

*/

variable "SG_name"{
    description = "Your security group name of your instance"
    type = string
}

variable "vpc_id" {
  description = "This is the id of the vpc you want to use"
  type = string
}

variable "ingressrules" {
    description = "Dynamic Ingress rules for security group"
    type = list(number)

}


variable "subnet_id"{
    description = "Your AWS subnet id"
    type = string
}

variable "instance_tag_name" {
    description = "Your instance tag name"
    type = string
}

/*
variable "ec2_instances" {
  description = "map containing the ec2-instances name, type and subnet-id"
  type = map(map(string) )
  default = {
    ansible = { ec2_inst_type = "t2.micro", ec2_subnet_id = "subnet-06b44e261f30bb91c" }
    docker = { ec2_inst_type = "t2.medium", ec2_subnet_id = "subnet-06b44e261f30bb91c" }
    kops  = { ec2_inst_type = "t2.medium", ec2_subnet_id = "subnet-00a53e0f73777b4f7" }
    sonarqube = { ec2_inst_type = "t2.medium", ec2_subnet_id = "subnet-06b44e261f30bb91c" }
    nexus = { ec2_inst_type = "t2.medium", ec2_subnet_id = "subnet-06b44e261f30bb91c" }   
  }
}


*/

variable "cidr" {
  description = "VPC CIDR for the security gorup"
  type = list(string)
}

variable "key_file_path" {
  description = "The path to your pub key file"
  type = string
}