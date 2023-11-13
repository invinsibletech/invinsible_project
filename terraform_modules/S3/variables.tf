/*
variable "s3_bucket_name" {
  description = "s3 bucket name"
  type = string
}
*/

variable "kms_sse_algorithm" {
  description = "The type of server side encryption algorithm to use."
  type = list(string)
  default = [ "AES256", "aws:kms", "aws:kms:dsse" ]
}

variable "s3_buc_name" {
  description = "S3 bucket tag_name"
  type = string
}


variable "acl" {
  description = "This are cannned acl permissions for your s3 bucket and object"
  type = list(string)
  default = [ "private", "public-read", "public-read-write", "bucket-owner-read", "bucket-owner-full-control", "authenticated-read", "aws-exec-read", "log-delivery-write"]
}

/*
variable "S3_object_key" {
  description = "S3 bucket object key"
  type = string
}

variable "object_source" {
  description = "The path to the source of where your object will be gotten from"
  type = string
}


variable "date" {
  description = "This is the object_lock_retain date" # The date should be in rfc format (year-month-dayT(hr):min:secZ)
  type = string
}
*/