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
