data "aws_subnets" "default" {
  filter {
    name   = "defaultForAz"
    values = ["true"]
  }
}

resource "aws_launch_template" "dev-wordpress" {
  name          = "dev-wordpress"
  description   = "Launch template for dev-wordpress"
  instance_type = "t3.micro"
  image_id      = aws_ami_from_instance.wordpress-prod-ami.id
  key_name      = aws_key_pair.ec2_ssh_key.key_name
  vpc_security_group_ids = [
    module.security_group.security_group_id
  ]
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "WordPress-dev"
    }
  }
}


resource "aws_autoscaling_group" "dev-wordpress" {
  launch_template {
    id      = aws_launch_template.dev-wordpress.id
    version = "$Latest"
  }
  min_size            = 0
  max_size            = 1
  desired_capacity    = 0
  vpc_zone_identifier = data.aws_subnets.default.ids
}

resource "aws_autoscaling_schedule" "wordpress_dev_scale_up" {
  scheduled_action_name  = "scale_up"
  min_size               = 1
  max_size               = 1
  desired_capacity       = 1
  recurrence             = "0 9 * * 1-5"
  autoscaling_group_name = aws_autoscaling_group.dev-wordpress.name
}

resource "aws_autoscaling_schedule" "wordpress_dev_scale_down" {
  scheduled_action_name  = "scale_down"
  min_size               = 0
  max_size               = 1
  desired_capacity       = 0
  recurrence             = "0 17 * * 1-5"
  autoscaling_group_name = aws_autoscaling_group.dev-wordpress.name
}
