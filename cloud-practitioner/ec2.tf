resource "aws_key_pair" "ec2_ssh_key" {
  key_name   = "${var.environment}-ec2-key"
  public_key = var.ec2_public_key

  tags = merge(local.tags, {
    "Name" = "${var.environment}-ec2-key"
  })
}

resource "aws_security_group" "ec2_allow_ssh" {
  name        = "${var.environment}_allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = module.vpc.vpc_id


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.tags, {
    "Name" = "${var.environment}_allow_ssh"
  })
}

data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  # This is the ID for the free tier Amazon Linux 2 AMI
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]

  }
}

# Use the correct private key to connect to the EC2 instance:
# ssh -i ~/.ssh/id_rsa ec2-user@${aws_instance.cloud_practitioner.public_ip}
resource "aws_instance" "cloud_practitioner" {
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = "t3.micro" # This instance type is eligible for the free tier

  key_name               = aws_key_pair.ec2_ssh_key.key_name
  subnet_id              = module.vpc.public_subnets[0] # Use the first public subnet
  vpc_security_group_ids = [aws_security_group.ec2_allow_ssh.id]

  associate_public_ip_address = true

  root_block_device {
    delete_on_termination = false

    encrypted   = true
    volume_size = 10
    tags = merge(local.tags, {
      Name = "${var.environment}-cloud-practitioner-volume"
    })
  }

  tags = merge(local.tags, {
    Name = "${var.environment}-cloud-practitioner"
  })
}
