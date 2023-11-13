# THIS RESOURCE IS USED TO ATTACH AN AUTOSCALING GROUP TO A LOAD BALANCER

# This is for application load balancers
resource "aws_autoscaling_attachment" "app_attach" {
  autoscaling_group_name = aws_autoscaling_group.scale_group.id
  lb_target_group_arn = data.aws_lb_target_group.group.arn
}

# This is for network load balancers
resource "aws_autoscaling_attachment" "net_attach" {
  autoscaling_group_name = aws_autoscaling_attachment.app_attach.id
  elb = data.aws_lb.lb.id
}