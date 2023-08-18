
provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    region  = "us-east-1"
    encrypt = true

    bucket = "<your state bucket goes here>"
    key    = "env"
  }

  required_version = ">=1.2.0"
}