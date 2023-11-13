data "aws_iam_policy_document" "ec2" {
  version =  "2012-10-17"
  statement {
    actions = [ "ec2:*" ]
    resources = [ "*" ]
    effect = Allow
  }

  statement {
    effect = Allow
    actions = [ "elasticloadbalancing:*" ]
    resources = "*"
  }

  statement {
    effect = Allow
    actions = [ "cloudwatch:*" ]
    resources = "*"
  }

  statement {
    effect = Allow
    actions = [ "autoscaling:*"]
    resources = "*"
  }

  statement {
    effect = Allow
    actions = [ "iam:CreateServiceLinkedRole" ]
    resources = "*"

    condition {
      test =  "ForAnyValue:StringEquals" 
      variable = "iam:AWSServiceName"
      values = [ "autoscaling.amazonaws.com",
       "ec2scheduled.amazonaws.com", 
       "elasticloadbalancing.amazonaws.com",
       "spot.amazonaws.com", 
       "spotfleet.amazonaws.com",
       "transitgateway.amazonaws.com" ]
       
    }
  }

  

  

}