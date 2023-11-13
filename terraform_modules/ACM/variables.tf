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

