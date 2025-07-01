resource "aws_subnet" "public-subnet" {
  #count             = 3 #012
  count             = length(var.public_cird_block)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(var.public_cird_block, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name        = "${var.vpc_name}-public-subnet-${count.index}"
    Owner       = local.Owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = "${var.environment}"

  }
}
