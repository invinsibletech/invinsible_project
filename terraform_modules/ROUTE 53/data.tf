# This is a data source for the hosted zone
data "aws_route53_zone" "zone" {
 name =  var.hosted_zone
}