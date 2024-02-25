data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  # This is the ID for the free tier Amazon Linux 2 AMI
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]

  }
}

resource "aws_cloudformation_stack" "wordpress-prod" {
  name = "${module.context.name}-prod"

  parameters = {
    Env          = "prod"
    BaseAmiId    = data.aws_ami.amazon_linux_2023.id
    SSHPublicKey = var.ec2_public_key
    DbPassword   = var.mysql_root_password
  }

  template_body = file("${path.module}/cf-wordpress.yml")
}

resource "aws_ami_from_instance" "wordpress-prod-ami" {
  name               = "${module.context.name}-prod-ami"
  source_instance_id = aws_cloudformation_stack.wordpress-prod.outputs.WordPressInstance
}

resource "aws_route53_health_check" "wordpress-prod-health_check" {
  reference_name    = "Wordpress Prod"
  ip_address        = aws_cloudformation_stack.wordpress-prod.outputs.WordPressInstanceIp
  port              = 80
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = "5"
  request_interval  = "30"

  tags = {
    Name = "Wordpress Prod"
  }
}
