data "aws_lb_target_group" "group" {
  arn = var.lb_tg_arn
  name = var.lb_tg_arn
}

data "aws_lb" "lb" {
  arn = var.lb_arn
  name = var.lb_name
}