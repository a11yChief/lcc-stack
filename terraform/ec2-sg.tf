resource "aws_security_group" "public_web" {
  name        = "public_web"
  description = "Public http and https access"
  vpc_id      = module.vpc.vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    ipv6_cidr_blocks = ["::/0"]
  }
}
