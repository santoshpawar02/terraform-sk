resource "aws_route_table_association" "public-subnet" {
  count          = length(var.public_cidr_block)
  subnet_id      = element(aws_subnet.public-subnet.*.id, count.index)
  route_table_id = aws_route_table.public_route_table.id
}


resource "aws_route_table_association" "private-subnet" {
  count          = length(var.private_cidr_block)
  subnet_id      = element(aws_subnet.private-subnet.*.id, count.index)
  route_table_id = aws_route_table.private_route_table.id
}
