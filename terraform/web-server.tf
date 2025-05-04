module "lcc_web" {
  source                            = "github.com/welcome-ally-ltd/aws-ec2-sles-instance?ref=v1.1"
  instance_name                     = "lcc-web-2"
  instance_type                     = "t4g.nano"
  architecture                      = "arm64"
  root_volume_type                  = "gp3"
  root_volume_size                  = 10
  delete_root_volume_on_termination = true
  associate_public_ip_address       = true
  additional_security_group_ids     = [aws_security_group.lcc_web.id]
  public_key                        = "~/.ssh/id_ed25519.pub"
  subnet_id                         = module.lcc.public_subnets[0].id
  primary_ipv6                      = false
  user_data                         = file("${path.module}/web-server.sh")

  depends_on = [
    module.lcc
  ]
}
