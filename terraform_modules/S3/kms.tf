# KMS key for encrypting my s3 bucket

resource "aws_kms_key" "mykey" {
    description = "This key is used to encrypt bucket objects"
    deletion_window_in_days = 10  # The number of days before AWS KMS deletes the KMS key. It defaults to 30 if not set. The number of days must be between 7 and 30.
 
}


