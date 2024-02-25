variable "aws_access_key_id" {
  description = "The AWS access key"
  type        = string
  sensitive   = true
}

variable "aws_secret_access_key" {
  description = "The AWS secret key"
  type        = string
  sensitive   = true
}

variable "aws_region" {
  description = "The AWS region"
  type        = string
}

# README:
# You can follow Github guide to generate a new SSH key and add it to your agent
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key
# Generate a new key with ssh-keygen -t ed25519 -C "email@example.org"
# and use the public key as the value for this variable
variable "ec2_public_key" {
  description = "The public_key to use to connect to the EC2 instance"
  type        = string
  sensitive   = true
}

variable "mysql_root_password" {
  description = "The root password for the MySQL database"
  type        = string
  sensitive   = true
}
