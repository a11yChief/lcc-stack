module "web_pages_bucket" {
  source = "github.com/welcome-ally-ltd/aws-s3-bucket"
  bucket_name = "lcc-website-bucket"
  force_destroy = true
  object_lock_enabled = false
}
