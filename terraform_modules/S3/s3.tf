resource "aws_s3_bucket" "s3-buc" {
    bucket = local.bucket_name
    
    object_lock_enabled = true

    
    tags = {
      "Name" =  var.s3_buc_name
      "Environment" = local.env_name
      "Team" = local.env_team
    }
}

resource "aws_s3_bucket_ownership_controls" "s3-buc-OC" {
    bucket = aws_s3_bucket.s3-buc.id
    rule {
      object_ownership = "BucketOwnerPreferred"
    }
  
}

resource "aws_s3_bucket_acl" "s3-buc-acl" {
    depends_on = [ aws_s3_bucket_ownership_controls.s3-buc-OC
     ]

     bucket = aws_s3_bucket.s3-buc.id
     acl = var.acl[0]
}


resource "aws_s3_bucket_versioning" "s3-buc-ver" {
    bucket = aws_s3_bucket.s3-buc.id
    versioning_configuration {
      status = "Enabled"
    }
}

resource "aws_s3_bucket_lifecycle_configuration" "s3-buc-LC" {
    bucket = aws_s3_bucket.s3-buc.id

    rule {
      id = "rule-1"

      status = "Enabled"

      transition {
        days = 30
        storage_class = "STANDARD_IA"
      }

      transition {
        days          = 90
        storage_class = "GLACIER"
      } 
    }

    rule {
      id = "rule-2"

      status = "Enabled"

      expiration {
        date = "2023-10-23T00:00:00Z"
      }
    }

    rule {
      id     = "rule-3"
      status = "Enabled"

      noncurrent_version_expiration {
        noncurrent_days = 90
      }

      noncurrent_version_transition {
        noncurrent_days = "30"
        storage_class   = "STANDARD_IA"
      }

      noncurrent_version_transition {
        noncurrent_days = "60"
        storage_class   = "GLACIER"
      }
    } 
}

# For configuring the aws s3 bucket server side encryption 

resource "aws_s3_bucket_server_side_encryption_configuration" "s3-buc-SSEC" {
  bucket = aws_s3_bucket.s3-buc.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey.id
      sse_algorithm = var.kms_sse_algorithm[1]
    }
  }

  
}

/*
resource "aws_s3_object" "s3_object" {
  # must have aws versioning enabled
  depends_on = [ aws_s3_bucket_versioning.s3-buc-ver ]
  bucket = aws_s3_bucket.s3-buc.id
  key = var.S3_object_key
  source = var.object_source

  object_lock_legal_hold_status = "ON"
  object_lock_mode = "GOVERNANCE"
  object_lock_retain_until_date = var.date     #  Date and time, in RFC3339

}

resource "aws_s3_bucket_public_access_block" "pub_access_block" {
  bucket = aws_s3_bucket.s3-buc.id

  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_object_lock_configuration" "s3-buc-OLC" {
    bucket = aws_s3_bucket.s3-buc.id
    rule {
      default_retention {
        mode = "GOVERNANCE"
        days = 2
      }
    }
}

*/