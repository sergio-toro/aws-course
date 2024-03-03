module "context" {
  source  = "rhythmictech/tags/terraform"
  version = "1.1.1"

  names = ["kinesis-dynamodb"]

  tags = {
    Course = "Solutions Architect"
    Module = "kinesis-dynamodb"
  }
}
