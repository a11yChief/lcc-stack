data "aws_route53_zone" "com" {
  name = "lythamchess.com"
}

data "aws_route53_zone" "org" {
  name = "lythamchess.org"
}
