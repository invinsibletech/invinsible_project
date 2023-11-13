variable "domain_name" {
  description = "This is the domain name that you want to register"
  type = string
}

variable "name_server" {
  description = "This is the name server domain 5"
  type = string
}

variable "hosted_zone" {
  description = "This is the hosted zone name"
  type = string
}

variable "record_type" {
  description = "This is the type of DNS record"
  type = string
}

variable "ttl" {
  description = "controls how long each record is valid and the time it takes for record updates to reach your end users"
  type = number
}

variable "record_value" {
  description = "This is the identity of the host the dns will be routing traffic to"
  type = list(number)
}

variable "alarm_name" {
  description = "alarm name "
  type = string
}

variable "fqdn" {
  description = "Fully Qualified Domain for e.g www.facebook.com"
  type = string
}

variable "port" {
  description = "The port of the endpoint to be checked."
  type = number
}

variable "protocol_type" {
  description = "This is the type of protocol "
  type = string
}

variable "path" {
  description = "This the resource path, it defaults to /"
  type = string
}

variable "failure_threshold" {
  description = "The number of consecutive health checks that an endpoint must pass or fail."
  type = number
}

variable "req_interval" {
  description = "The number of seconds between the time that Amazon Route 53 gets a response from your endpoint and the time that it sends the next health-check request."
  type = number
}

variable "name" {
  description = "The name tag of the health check"
  type = string
}

