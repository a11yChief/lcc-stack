module "lcc" {
  source                      = "github.com/welcome-ally-ltd/aws-vpc-small?ref=v0"
  environment_name            = "lcc-small"
  ipv4_cidr_block             = "10.2.0.0/16"
  subnet_count                = 1
  interface_endpoint_services = []
}
