# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "vpc-terraform" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = "true"
  tags = {
    Name = "vpc-terraform"
  }
}

# Create internet gateway
resource "aws_internet_gateway" "igw-terraform" {
  vpc_id = aws_vpc.vpc-terraform.id

  tags = {
    Name = "igw-terraform"
  }
}

# Subnet creation
resource "aws_subnet" "public_subnet_terraform" {
  vpc_id     = aws_vpc.vpc-terraform.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public_subnet_terraform"
  }
}

# Create Route table
resource "aws_route_table" "rt_terraform" {
  vpc_id = aws_vpc.vpc-terraform.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-terraform.id
  }
  tags = {
    Name = "rt_terraform"
  }
}

resource "aws_route_table_association" "pub-rta_terraform" {
  subnet_id      = aws_subnet.public_subnet_terraform.id
  route_table_id = aws_route_table.rt_terraform.id
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc-terraform.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow-all"
  }
}