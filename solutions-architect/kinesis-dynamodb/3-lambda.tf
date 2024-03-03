data "archive_file" "kinesis_to_dynamo_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda/kinesis-to-dynamo/index.mjs"
  output_path = "${path.module}/lambda/kinesis-to-dynamo.zip"
}

data "local_file" "lambda_source_code" {
  filename = "${path.module}/lambda/kinesis-to-dynamo/index.mjs"
}

resource "aws_lambda_function" "kinesis_lambda" {
  filename         = data.archive_file.kinesis_to_dynamo_zip.output_path
  source_code_hash = data.local_file.lambda_source_code.content_sha1
  function_name    = local.lambda_function_name
  role             = aws_iam_role.lambda_role.arn
  handler          = "index.handler"
  runtime          = "nodejs20.x"

  environment {
    variables = {
      DYNAMODB_TABLE = aws_dynamodb_table.kinesis_data.name
    }
  }

  tags = module.context.tags_no_name

  depends_on = [aws_cloudwatch_log_group.kinesis_to_dynamo]
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.kinesis_lambda.function_name
  principal     = "logs.amazonaws.com"
}

resource "aws_lambda_event_source_mapping" "kinesis_lambda_mapping" {
  event_source_arn  = aws_kinesis_stream.kinesis_stream.arn
  function_name     = aws_lambda_function.kinesis_lambda.function_name
  starting_position = "TRIM_HORIZON"
}
