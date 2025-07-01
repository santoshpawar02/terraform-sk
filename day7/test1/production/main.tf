#This Terraform Code Deploys Basic VPC Infra.
provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "my-tf-test-bucket17895481"
    key    = "production.tfstate"
    region = "us-east-1"
  }
}
