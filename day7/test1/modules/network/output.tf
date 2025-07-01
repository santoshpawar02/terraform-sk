output "vpc_name" {
  value = var.vpc_name
}

output "vpc_id" {
  value = aws_vpc.default.id
}

output "environment" {
  value = var.environment
}

output "public-subnet" {
  value = aws_subnet.public-subnet.*.id
}

output "private-subnet" {
  value = aws_subnet.private-subnet.*.id
}


