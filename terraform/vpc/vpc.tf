resource "aws_vpc" "main" {
  cidr_block                       = var.ipv4_cidr_block
  instance_tenancy                 = "default"
  enable_dns_hostnames             = true
  enable_dns_support               = true
  assign_generated_ipv6_cidr_block = true

  tags = {
    Name     = var.environment_name
    Critical = true
  }
}