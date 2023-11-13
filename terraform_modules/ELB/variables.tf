variable "lb_name" {
  description = "The load balancer's name"
  type = map(string)
  default = {
    "net_lb" = ""
    "app_lb" = ""
    
  }
}

variable "subnet_id" {
  description = "The subnet_id of the vpc that you want to use"
  type = map(string)
  default = {
    "Subnet_1" = ""
    "Subnet_2" = ""
  }
}

variable "lb_type" {
  description = "The load balancer's type"
  type = map(string)
  default = {
    "type_1" = "network"
    "type_2" = "application"
}
}

variable "target_group_name" {
  description = "The load balancer's target group"
  type = map(string)
  default = {
    "net_lb" = ""
    "app_lb" = ""
  }
}


variable "net_lb_port" {
  description = "The load balancer's target group's port"
  type = string
}


variable "net_lb_protocol" {
  description = "The load balancer's target group's protocol"
  type = string
}


variable "vpc_id" {
  description = "The vpc you intend to use"
  type = string
}

variable "target_type" {
  description = "The type of target"
  type = map(string)
  default = {
    "type1" = "instance"
    "type2" = "ip"
    "type3" = "lambda"
    "type4" = "alb"
  }
  
}

variable "action_type" {
  description = "This specifies the type of default action that you want to specify to your listener"
  type = list()
  default = ["forward", "redirect", "fixed-response", "authenticate-cognito", "authenticate-oidc"]
}

variable "domain_name" {
  description = "Fully qualified domain name (FQDN) in the certificate."
  type = string
}

variable "validation_domain" {
  description = "This must be the same as the domain_name value or a super-domain of the domain_name value"
  type = string
}

variable "domain_name" {
  description = "This is the domain name for which the certificate should be issued"
  type = string
}

variable "val_method" {
  description = "This is the method to use for validation"
  type = list()
  default = ["DNS", "EMAIL"]
}

variable "SG_id" {
  description = "This is the security group of your application load balancer"
  type = string
}

variable "bucket_name" {
  description = "The S3 bucket for storing the load balancer's logs"
  type = string
}

variable "app_lb_port" {
  description = "This is the port_number of your application load balancer"
  type = string
}

variable "app_lb_protocol" {
  description = "This is the protocol of your application load balancer"
  type = string
}

variable "cookie_duration" {
  description = "The time period(seconds) during which requests from a client should be routed to the same target"
  type = string
}
