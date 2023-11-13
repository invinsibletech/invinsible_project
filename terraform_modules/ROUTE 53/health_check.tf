resource "aws_route53_health_check" "health" {
  fqdn = var.fqdn   # Fully Qualified Domain for e.g www.facebook.com.
  port = var.port     # The port of the endpoint to be checked.
  type =  var.protocol_type      # This is basically the type of traffic that will be checked e.g HTTPS, HTTP.
  resource_path = var.path   # The path that you want Amazon Route 53 to request when performing health checks.
  failure_threshold = var.failure_threshold    # The number of consecutive health checks that an endpoint must pass or fail.
  request_interval = var.req_interval  # The number of seconds between the time that Amazon Route 53 gets a response from your endpoint and the time that it sends the next health-check request.

  tags = {
    "Name" = var.name
  }

}


