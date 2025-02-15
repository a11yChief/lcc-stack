module "domain" {
  source = "github.com/welcome-ally-ltd/aws-route53-domain-records"
  root_details = {
    root_domain_name = data.aws_route53_zone.root.name
    ipv4_addresses   = [module.web_server.instance.public_ip]
    ipv6_addresses   = []
  }

  subdomains = {}
}
