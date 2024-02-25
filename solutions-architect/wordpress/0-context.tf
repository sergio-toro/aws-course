module "context" {
  source  = "rhythmictech/tags/terraform"
  version = "1.1.1"

  names = ["wordpress"]

  tags = {
    Course = "Solutions Architect"
    Module = "wordpress"
  }
}
