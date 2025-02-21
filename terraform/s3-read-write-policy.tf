resource "aws_iam_role_policy" "s3_read_write_policy" {
  name = "S3ReadWritePolicy"
  role = module.web_server.instance_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:ListBucket",
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}
