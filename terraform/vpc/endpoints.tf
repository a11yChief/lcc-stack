resource "aws_vpc_endpoint" "s3" {
  vpc_id          = aws_vpc.main.id
  service_name    = "com.amazonaws.eu-west-2.s3"
#  route_table_ids = [aws_route_table.private_rt.id]
}

resource "aws_vpc_endpoint" "dynamodb" {
  vpc_id          = aws_vpc.main.id
  service_name    = "com.amazonaws.eu-west-2.dynamodb"
#  route_table_ids = [aws_route_table.private_rt.id]
}

resource "aws_vpc_endpoint" "interface" {
  for_each            = var.interface_endpoint_services
  vpc_id              = aws_vpc.main.id
  vpc_endpoint_type   = "Interface"
  subnet_ids          = [aws_subnet.private[0].id]
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.interface_endpoints.id]
  service_name        = each.value
}

