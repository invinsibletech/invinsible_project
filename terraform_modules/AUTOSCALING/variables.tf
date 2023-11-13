variable "group_name" {
  description = "The name of your aws autoscaling group"
  type = string
}

variable "max_size" {
  description = "The max size you need "
  type = number

}

variable "min_size" {
  description = "The min size you need "
  type = number
}

variable "desired_cap" {
  description = "This is the desired capacity you need"
  type = number
}

variable "AZs" {
  description = "The Availability Zones "
  type = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c" ]
}

variable "template_name" {
  description = "The name of the launch template"
  type = string
}

variable "ami_id" {
  description = "The ami identity of your instance"
  type = string
}

variable "instance_type" {
  description = "The type of instance you intend to use"
  type = string
}

variable "path_to_file" {
  description = "The path to the bash shell script that you intend to be passed at runtime"
  type = string
}

variable "lb_tg_arn" {
  description = "The arn of load target group that you want to attach"
  type = string
}

variable "lb_tg_name" {
  description = "The name of the target group that you are attaching"
  type = string
}

variable "lb_arn" {
  description = "The arn of the network load balancer that you are attaching"
  type = string
}

variable "lb_name" {
  description = "The name of the network load balancer that you are attaching"
  type = string
}