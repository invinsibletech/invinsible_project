variable "iam_user_name" {
  description = "The name of the Iam user"
  type = string
}

variable "path" {
  description = "Path in which to create the user."
  type = string
}

variable "policy_name" {
  description = "The name of the iam user policy"
  type = string
}

variable "iam_role_name" {
  description = "The name of iam role"
  type = string
}

variable "account_alias" {
  description = "The alias for your AWS account ID"
  type = string
}

variable "iam_group_name" {
  description = "The name of the iam group"
  type = string
}

variable "group_path" {
  description = "The path which to create the group"
  type = string
}

variable "group_member" {
  description = "The name of the aws iam group membership"
  type = string
}