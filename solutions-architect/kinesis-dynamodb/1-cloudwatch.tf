resource "aws_cloudwatch_log_group" "kinesis_to_dynamo" {
  name              = "/aws/lambda/${local.lambda_function_name}"
  retention_in_days = 14

  tags = module.context.tags_no_name
}
