module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.2"

  name        = module.context.name
  description = "Security group for ${module.context.name}"

  ingress_cidr_blocks = [
    "0.0.0.0/0", # README: Access to the internet only for testing purposes
  ]
  ingress_rules = [
    "http-80-tcp",
    "ssh-tcp",
  ]
  egress_rules = ["all-all"]

  tags = module.context.tags_no_name
}
