resource "aws_lb" "net_lb" {
   name = var.lb_name["net_lb"]
   internal = false
   load_balancer_type = var.lb_type["type_1"]
   subnets = data.aws_subnet.subnet_id.id

   enable_deletion_protection = false
   enable_cross_zone_load_balancing = true

   tags = {
     "Name" = local.Env
   }


}

resource "aws_lb_target_group" "target_grp" {
  name = var.target_group_name["net_lb"]
  port = var.net_lb_port
  protocol = var.net_lb_protocol
  vpc_id = var.vpc_id
  target_type = var.target_type["type1"]             #You cannot specify target for a target group using both instance and ip.
  #you can't specify publicy routed ips. 
  # The target type defaults to instance 
  depends_on = [ aws_lb.net_lb ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener" "listener" {
  
  load_balancer_arn = aws_lb.net_lb.arn
  port = var.net_lb_port
  protocol = var.net_lb_protocol

  default_action {
    type = var.type[1]
    target_group_arn = aws_lb_target_group.target_grp.arn
  }

  
}


#This resource is for additional certificates and does not replace the default certificate on the listener.
resource "aws_lb_listener_certificate" "certificate" {
  listener_arn = aws_lb_listener.listener.arn
  certificate_arn = data.aws_acm_certificate.cert.arn
}

