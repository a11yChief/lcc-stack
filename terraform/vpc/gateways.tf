resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name      = "${var.environment_name}-igw"
    Scope     = "external"
    AssetType = "network"
    Critical  = "true"
  }
}

resource "aws_egress_only_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}