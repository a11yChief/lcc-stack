module "vpc" {
  source                      = "github.com/welcome-ally-ltd/aws-vpc?ref=v1.3"
  environment_name            = "lcc"
  ipv4_cidr_block             = "10.1.0.0/16"
  subnet_count                = 2
  interface_endpoint_services = []
}
