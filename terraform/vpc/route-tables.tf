resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.main.id
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name      = "${var.environment_name}-public-rt"
    Scope     = "external"
    AssetType = "network"
    Critical  = true
  }
}

resource "aws_route_table_association" "public_rta" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

