resource "aws_s3_bucket" "pages" {
  bucket = "lcc-website-pages"
}

resource "aws_s3_bucket_ownership_controls" "default" {
  bucket = aws_s3_bucket.pages.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "default" {
  depends_on = [aws_s3_bucket_ownership_controls.default]

  bucket = aws_s3_bucket.pages.id
  acl    = "private"
}
