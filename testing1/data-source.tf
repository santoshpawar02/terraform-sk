data "aws_vpc" "data-source" {
  id = "vpc-04417dbce3e787069"
}


resource "aws_internet_gateway" "data-igw" {
  vpc_id = data.aws_vpc.data-source.id

  tags = {
    Name = "data-igw"
  }
}
