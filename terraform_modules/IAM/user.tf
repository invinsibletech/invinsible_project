resource "aws_iam_user" "user" {
  name = var.iam_user_name
  path = var.path             # Path in which to create the user. Default path "/"
  force_destroy = true
  

  tags = {
    "Name" = var.iam_user_name
  }
}

resource "aws_iam_access_key" "key" {
  user = aws_iam_user.user.name
}

resource "aws_iam_user_policy" "policy" {
  name = var.iam_user_name
  user = aws_iam_user.user.name
  policy = data.aws_iam_policy_document.ec2.json
}

