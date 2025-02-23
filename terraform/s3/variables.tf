variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "force_destroy" {
  description = "Destroy all objects in the bucket when destroying"
  type        = bool
}

variable "object_lock_enabled" {
  description = "Enable Object Lock, cannot be removed once enabled"
  type        = bool
}