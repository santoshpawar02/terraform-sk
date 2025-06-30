resource "aws_security_group" "allow_all" {
  name        = "${var.vpc_name}-allow-all"
  description = "Allow all inbound"
  vpc_id      = aws_vpc.default.id

  dynamic "ingress" {
    for_each = var.ingress_value
    content {
      from_port   = ingress.value # CORRECTED: Use ingress.value
      to_port     = ingress.value # CORRECTED: Use ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = "${var.vpc_name}-allow-all"
    Owner       = local.Owner
    CostCenter  = local.CostCenter
    Team        = local.Team
    environment = local.environment
  }
}

