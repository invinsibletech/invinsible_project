data "aws_iam_policy_document" "assume_role" {
    version = "2012-10-17"
    statement {
      effect = "Allow"

      principals {
        type = "Service"
        identifiers = ["dlm.amazonaws.com"]
      }

      actions = [ "sts:AssumeRole" ]
    }
}


data "aws_iam_policy_document" "dlm_lifecycle" {
    statement {
        effect = "Allow"
      
    
        actions = [ 
            "ec2:CreateSnapshot",
            "ec2:CreateSnapshots",
            "ec2:DeleteSnapshot",
            "ec2:DescribeInstances",
            "ec2:DescribeVolumes",
            "ec2:DescribeSnapshots",
            "ec2:EnableFastSnapshotRestores",
            "ec2:DescribeFastSnapshotRestores",
            "ec2:DisableFastSnapshotRestores",
            "ec2:CopySnapshot",
            "ec2:ModifySnapshotAttribute",
            "ec2:DescribeSnapshotAttribute",
            "ec2:DescribeSnapshotTierStatus",
            "ec2:ModifySnapshotTier"
    ]

        resources = ["*"]
    } 

    statement {
      effect = "Allow"
      actions = ["ec2:CreateTags"]

      resources = ["arn:aws:ec2:*::snapshot/*"]
    }

  
}