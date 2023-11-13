resource "aws_launch_template" "template" {
  name =var.template_name
  image_id =var.ami_id
  instance_type = var.instance_type

  user_data = filebase64(var.path_to_file) # ("${path.module}/example.sh")

  
}
