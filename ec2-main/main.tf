resource "aws_instance" "web-1" {
  # ami = "${data.aws_ami.my_ami.id}"
  ami               = "ami-09c813fb71547fc4f"
  availability_zone = "us-east-1a"
  instance_type     = "t2.micro"
  # key_name = "LaptopKey"
  subnet_id                   = data.aws_subnet.Terraform_Public_Subnet1-testing.id
  vpc_security_group_ids      = ["${data.aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "Server-1"
    Env        = "Prod"
    Owner      = "Santosh"
    CostCenter = "ABCD"
  }
}

terraform {
  backend "s3" {
    bucket = "mybucket12456mybucket12456"
    key    = "ec2-infra.tfstate"
    region = "us-east-1"
  }
}
