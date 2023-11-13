# This resource is used to create an iam group
resource "aws_iam_group" "group" {
  name = var.iam_group_name
  path =  var.group_path   # This default to "/"            
}

# This resource is used to assign a list of users to a specific group
resource "aws_iam_group_membership" "team" {
  name = var.group_member

  users = [  
    
  ]

  group = aws_iam_group.group.name
}


# Use this if you want to associate a user with multiple or a list groups
resource "aws_iam_user_group_membership" "user_group" {
  user = aws_iam_user.user.name

  groups = [ 

   ]
}