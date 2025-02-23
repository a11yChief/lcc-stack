module "web_pages_bucket" {
  source = "./s3"
  bucket_name = "lcc-website-bucket"
  force_destroy = true
  object_lock_enabled = false
}