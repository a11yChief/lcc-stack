module "web_server" {
  source        = "github.com/welcome-ally-ltd/aws-ec2-sles-instance"
  instance_name = "lcc-web"
  instance_type = "t4g.nano"
  public_key    = "~/.ssh/id_ed25519.pub"
  subnet_id     = module.vpc.public_subnets[0].id
  user_data     = file("${path.module}/web-server.sh")

  depends_on = [
    module.vpc
  ]
}
