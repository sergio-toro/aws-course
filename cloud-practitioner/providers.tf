terraform {
  backend "local" {}
  required_version = ">= 1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.26.0"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.CLOUD_PRACTITIONER_AWS_ACCESS_KEY_ID
  secret_key = var.CLOUD_PRACTITIONER_AWS_SECRET_ACCESS_KEY
}
