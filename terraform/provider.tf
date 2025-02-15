provider "aws" {
  region = "eu-west-2"

  default_tags {
    tags = {
      Terraform   = true
      Project     = "Lytham Chess Club"
      BillingType = "gift"
    }
  }
}
