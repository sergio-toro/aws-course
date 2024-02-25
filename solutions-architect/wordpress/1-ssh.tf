resource "aws_key_pair" "ec2_ssh_key" {
  key_name   = "ec2-key-${module.context.name}"
  public_key = var.ec2_public_key

  tags = merge(module.context.tags_no_name, {
    "Name" = "ec2-key-${module.context.name}"
  })
}
