resource "aws_kinesis_stream" "kinesis_stream" {
  name = "data_to_dynamo"

  stream_mode_details {
    stream_mode = "ON_DEMAND"
  }

  tags = module.context.tags_no_name
}

/*
aws kinesis put-record \
  --stream-name data_to_dynamo\
  --data "$(echo '{"id":"123","foo":"example"}' | base64)" \
  --partition-key "id"\
  --profile sergio-learn
*/
