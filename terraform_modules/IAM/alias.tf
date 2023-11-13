/* If you want the URL for your sign-in page to contain your company name 
or other friendly identifier instead of your AWS account ID, 
you can create an alias for your AWS account ID. 
*/
resource "aws_iam_account_alias" "alias" {
  account_alias = var.account_alias
}