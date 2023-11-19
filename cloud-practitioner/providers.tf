terraform {
  backend "local" {
    # path = "../../terraform/cloud-practitioner.tfstate"
  }
}

provider "aws" {
  region     = "eu-south-2"
  access_key = var.CLOUD_PRACTITIONER_AWS_ACCESS_KEY_ID
  secret_key = var.CLOUD_PRACTITIONER_AWS_SECRET_ACCESS_KEY
}
