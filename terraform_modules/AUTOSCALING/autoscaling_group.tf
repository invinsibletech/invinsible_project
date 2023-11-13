resource "aws_autoscaling_group" "scale_group" {
  name = var.group_name
  availability_zones = var.AZs
  max_size = var.max_size
  min_size = var.min_size
  desired_capacity = var.desired_cap


  launch_template {
    id = aws_launch_template.template.id
    version = "Latest"

  }

}

