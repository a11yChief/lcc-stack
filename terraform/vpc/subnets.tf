data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public" {
  count           = var.subnet_count
  vpc_id          = aws_vpc.main.id
  ipv6_cidr_block = cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, count.index)
  cidr_block      = cidrsubnet(var.ipv4_cidr_block, 8, count.index)
  # ipv6_native = true
  availability_zone                              = element(data.aws_availability_zones.available.names, count.index)
  assign_ipv6_address_on_creation                = true # Auto-allocate IPv6 addresses
#   enable_dns64                                   = true
#   enable_resource_name_dns_aaaa_record_on_launch = true

  tags = {
    Name      = "${var.environment_name}-public-${count.index}"
    Scope     = "external"
    AssetType = "network"
    Critical  = "true"
  }
}

resource "aws_subnet" "private" {
  count           = var.subnet_count
  vpc_id          = aws_vpc.main.id
  ipv6_cidr_block = cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, count.index + var.subnet_count)
  cidr_block      = cidrsubnet(var.ipv4_cidr_block, 8, count.index + var.subnet_count)
  # ipv6_native = true
  availability_zone = element(
    data.aws_availability_zones.available.names,
    count.index
  )
  assign_ipv6_address_on_creation                = true # Auto-allocate IPv6 addresses
#   enable_dns64                                   = true
#   enable_resource_name_dns_aaaa_record_on_launch = true

  tags = {
    Name      = "${var.environment_name}-private-${count.index}"
    Scope     = "internal"
    AssetType = "network"
    Critical  = "true"
  }
}

resource "aws_subnet" "db" {
  count           = var.subnet_count
  vpc_id          = aws_vpc.main.id
  ipv6_cidr_block = cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, count.index + var.subnet_count * 2)
  cidr_block      = cidrsubnet(var.ipv4_cidr_block, 8, count.index + var.subnet_count * 2)
  # ipv6_native = true
  availability_zone = element(
    data.aws_availability_zones.available.names,
    count.index
  )
  assign_ipv6_address_on_creation                = true # Auto-allocate IPv6 addresses
#   enable_dns64                                   = true
#   enable_resource_name_dns_aaaa_record_on_launch = true

  tags = {
    Name      = "${var.environment_name}-db-${count.index}"
    Scope     = "internal"
    AssetType = "network"
    Critical  = "true"
  }
}

