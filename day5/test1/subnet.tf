resource "aws_subnet" "public-subnet" {
  #  count             = 3 #starts from 0-2
  count             = length(var.public_cidr_block)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(var.public_cidr_block, count.index + 1)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name        = "${var.vpc_name}-publick-subnet-${count.index + 1}"
    Owner       = local.Owner
    CostCenter  = local.CostCenter
    Team        = local.Team
    environment = "var.environment"
  }
}


resource "aws_subnet" "private-subnet" {
  #  count             = 3 #starts from 0-2
  count             = length(var.private_cidr_block)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(var.private_cidr_block, count.index + 1)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name        = "${var.vpc_name}-private-subnet-${count.index + 1}"
    Owner       = local.Owner
    CostCenter  = local.CostCenter
    Team        = local.Team
    environment = "var.environment"
  }
}

