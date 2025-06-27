data "aws_vpc" "terraform-aws-testing" {
  id = "vpc-0916f0f2fcd85363a"
}

data "aws_subnet" "Terraform_Public_Subnet1-testing" {
  id = "subnet-0e063de492d137efa"
}

data "aws_security_group" "allow_all" {
  id = "sg-0145b02deec864e64"
}



