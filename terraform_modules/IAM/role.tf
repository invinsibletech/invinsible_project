resource "aws_iam_role" "role" {
  name = var.iam_role_name
  force_detach_policies = true
  assume_role_policy = data.aws_iam_policy_document.ec2.json

  tags = {
    "Name" = var.iam_role_name 
  }
}

