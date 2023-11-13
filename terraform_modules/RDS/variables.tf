variable "initial_storage" {
  description = "This is the initial allocated storage"
  type = number
}

variable "max_storage" {
  description = "This is the maximum allocated storage"
  type = number
}

variable "period" {
  description = "This is the backup retention period"
  type = number
}

variable "engine" {
  description = "This is the database engine you intend to use"
  type = string
}

variable "engine_version" {
  description = "This is the version of the database engine that you want to use"
  type = string
}

variable "license_model" {
  description = "The license model"
  type = list(string)
  default = [ "general-public-license", "bring-your-own-license", "amazon-license" ]
}

variable "storage_type" {
  description = "This is the storage type"
  type = string
  default = "gp3"
}

variable "identifier" {
  description = "This is the name of the db instance"
  type = string
}

variable "username" {
  description = "username"
  type = string
}

variable "password" {
  description = "username"
  type = string
}

variable "group_name" {
  description = "The subnet group name"
  type = string
}

variable "subnet_id" {
  description = "A list various subnets that you want to provision your database in"
  type = list(string)
}

variable "db_instance_name" {
  description = "The name of the db instance"
  type = string
}