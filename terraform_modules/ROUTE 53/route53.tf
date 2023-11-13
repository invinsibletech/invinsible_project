resource "aws_route53_record" "record" {
  for_each = local.record
  zone_id = data.aws_route53_zone.zone.id
  name = each.value
  type = var.record_type
  records = var.record_value

# Time to Live (TTL)
  ttl = var.ttl                     
  /* is a field on DNS records that controls 
  how long each record is valid and — as a result — 
  how long it takes for record updates to reach your end users */
}
