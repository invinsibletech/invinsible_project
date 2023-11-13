resource "aws_lb" "app_lb" {
  name = var.lb_name["app_lb"]
  internal = false
  load_balancer_type = var.lb_type["type_2"]
  security_groups = data.aws_security_group.SG.id

  enable_cross_zone_load_balancing = true

  for_each = var.subnet_id
  subnet_mapping {
    subnet_id = each.value
  }

  enable_deletion_protection = true
  # S3 bucket to store the logs in
  access_logs {
    bucket = var.bucket_name
    prefix = "log-load-balancer"
    enabled = true       # This defaults to false
  }

  tags = {
    "Environment" = local.Env
  }
}


resource "aws_lb_listener" "app_lb_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port = var.app_lb_port
  protocol = var.app_lb_protocol
  ssl_policy = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn = data.aws_acm_certificate.cert.arn
  default_action {
    type = var.action_type[0]
    target_group_arn = aws_lb_target_group.app_lb_TG.arn
  }
}

resource "aws_lb_target_group" "app_lb_TG"{
  name = var.target_group_name["app_lb"]
  port = var.app_lb_port
  protocol = var.app_lb_protocol
  target_type = var.target_type["type2"]  # The default is instance

  vpc_id = var.vpc_id
  load_balancing_algorithm_type = "least_outstanding_requests"

  stickiness {
    enabled = true
    type = "lb_cookie"
    cookie_duration = var.cookie_duration  # The time period in seconds, during which requests from a client should be routed to the same target.
    # The default value is 1 day(86400 seconds).
    
  }

  health_check {
    healthy_threshold = 2 # Number of consecutive health check successes required before considering a target healthy.
    interval = 30 # The approximate amount of time(seconds), between health checks of an individual target.
    protocol = var.app_lb_protocol   # The protocol the load balancer uses when performing health checks.
    unhealthy_threshold = 2   # Number of consecutive health check failures required before considering a target unhealthy.
  }

  depends_on = [ aws_lb.aws_lb.app_lb ]

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_lb_listener_rule" "aws_lb_listener_rule" {
  listener_arn = aws_lb_listener.app_lb_listener.arn

  action {
    type =   var.action_type["0"]
    target_group_arn = aws_lb_target_group.app_lb_TG.arn
  }

  condition {
    host_header {
      values = [ "*.invinsible007.net" ]  # This is where you insert the values of the hostnames e.g product.invinsible007.net
    }
  }
}