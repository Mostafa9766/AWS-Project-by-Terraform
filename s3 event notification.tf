data "aws_s3_bucket" "bucket" {
  bucket = "terraform-state-bucket001"
}
resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.terraform_lambda_func.arn
  principal     = "s3.amazonaws.com"
  source_arn    = data.aws_s3_bucket.bucket.arn
}
resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = data.aws_s3_bucket.bucket.id
  lambda_function {
    lambda_function_arn = aws_lambda_function.terraform_lambda_func.arn
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = "*terraform*"
    filter_suffix       = ".tfstate"
  }

}
