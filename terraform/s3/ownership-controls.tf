resource "aws_s3_bucket_ownership_controls" "default" {
  bucket = aws_s3_bucket.pages.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}