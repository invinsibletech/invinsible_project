resource "aws_kms_key" "key" {
    description = "The key for the db_instance encryption"
    deletion_window_in_days =  10  # This is the waiting period, it must be between 7 and 30 days. It defaults to 30
}