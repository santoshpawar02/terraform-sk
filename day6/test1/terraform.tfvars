aws_region         = "us-east-1"
vpc_cidr           = "172.18.0.0/16"
vpc_name           = "devops-vpc"
key_name           = "LaptopKey"
azs                = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_cidr_block  = ["172.18.1.0/24", "172.18.2.0/24", "172.18.3.0/24"]
private_cidr_block = ["172.18.10.0/24", "172.18.20.0/24", "172.18.30.0/24"]
environment        = "dev"
ingress_value      = ["80", "8080", "22", "443", "3306", "1443", "123"]
amis = {
  us-east-1 = "ami-020cba7c55df1f615"
  us-east-2 = "ami-0d1b5a8c13042c939"
}
