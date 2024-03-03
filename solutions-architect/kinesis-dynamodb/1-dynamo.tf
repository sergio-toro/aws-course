resource "aws_dynamodb_table" "kinesis_data" {
  name         = "KinesisDataTable"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = module.context.tags_no_name
}
