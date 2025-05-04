module "lythamchess_com" {
  source = "github.com/welcome-ally-ltd/aws-route53-domain-records"
  root_details = {
    root_domain_name = data.aws_route53_zone.com.name
    ipv4_addresses   = [module.lcc_web.instance.public_ip]
    ipv6_addresses   = []
  }

  subdomains = {}
}

module "lythamchess_org" {
  source = "github.com/welcome-ally-ltd/aws-route53-domain-records"
  root_details = {
    root_domain_name = data.aws_route53_zone.org.name
    ipv4_addresses   = [module.lcc_web.instance.public_ip]
    ipv6_addresses   = []
  }

  subdomains = {}
}
