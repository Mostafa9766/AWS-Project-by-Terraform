
data "archive_file" "zip_the_python_code" {
  type = "zip"
  source_dir = "./python/"
  output_path = "./python/pythoncode.zip"
}
resource "aws_lambda_function" "terraform_lambda_func" {
  filename = "./python/pythoncode.zip"
  function_name = "ses_Lambda_Function"
  role = aws_iam_role.lambda_role.arn
  handler = "index.lambda_handler"
  runtime = "python3.8"
  depends_on = [aws_iam_role_policy_attachment.test_attach]

}
