resource "aws_security_group" "interface_endpoints" {
  name   = "interface-traffic-ingress"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    ipv6_cidr_blocks = concat(aws_subnet.private[*].ipv6_cidr_block, aws_subnet.db[*].ipv6_cidr_block)
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = concat(aws_subnet.private[*].cidr_block, aws_subnet.db[*].cidr_block)
  }

  tags = {
    Name      = "secretsmanager"
    Scope     = "internal"
    AssetType = "security"
    Critical  = "false"
  }

  lifecycle {
    create_before_destroy = true
  }
}
