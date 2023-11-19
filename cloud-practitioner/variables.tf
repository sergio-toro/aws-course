variable "CLOUD_PRACTITIONER_AWS_ACCESS_KEY_ID" {
  description = "The AWS access key"
  type        = string
}

variable "CLOUD_PRACTITIONER_AWS_SECRET_ACCESS_KEY" {
  description = "The AWS secret key"
  type        = string
}

variable "aws_region" {
  description = "The AWS region"
  type        = string
}
variable "environment" {
  description = "The environment"
  type        = string
}
variable "ec2_public_key" {
  description = "The public_key to use to connect to the EC2 instance"
  type        = string
}
variable "keybase_username" {
  description = "The Keybase username to encrypt the password with"
  type        = string
}


