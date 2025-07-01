#This Terraform Code Deploys Basic VPC Infra.
provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "my-tf-test-bucket178954812"
    key    = "development.tfstate"
    region = "us-east-1"
  }
}
