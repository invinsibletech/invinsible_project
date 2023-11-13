resource "aws_iam_role" "dlm_lifecycle_role" {
  name = "dlm-lifecycle-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  force_detach_policies = true
}


resource "aws_iam_role_policy" "iam_role_pol" {
  name = "dlm-lifecycle-role-policy"
  role = aws_iam_role.dlm_lifecycle_role.id
  policy = data.aws_iam_policy_document.dlm_lifecycle.json
}




resource "aws_dlm_lifecycle_policy" "dlm_lp" {
  description = " EBS lifecycle policy"
  execution_role_arn = aws_iam_role.dlm_lifecycle_role.arn
  state = "ENABLED"

  policy_details {
    resource_types = ["VOLUME"]

    schedule {
      name = "3 weeks of daily snapshots"

      create_rule {
        interval = 24
        interval_unit = "HOURS"
        times = ["23:45"]
      }

      retain_rule {
        count = 13
      }

      tags_to_add = {
        SnapshotCreator = "DLM"
      }

      copy_tags = false
    }

    target_tags = {
      "Snapshot" = "true"
    }
  }


}