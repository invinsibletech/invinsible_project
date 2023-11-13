# This is the data source for the security group of our load balancer
data "aws_security_group" "SG" {
  id = var.SG_id
}

# This is the data source for the acm_certificate
data "aws_acm_certificate" "cert" {
  domain = var.domain_name
  statuses = [ "AMAZON_ISSUED" ]
  most_recent = true
}
