resource "aws_s3_bucket" "main" {
  bucket        = "octopuscloud"
  force_destroy = "false"

  # grant {
  #   id          = "6a69b488cfd3cc4ef1b65cd778d7fc702589fdde429bea40116a9a6ff73d8f01"
  #   permissions = ["FULL_CONTROL"]
  #   type        = "CanonicalUser"
  # }

  object_lock_enabled = "false"
  region              = "us-east-1"
  # request_payer       = "BucketOwner"

  # server_side_encryption_configuration {
  #   rule {
  #     apply_server_side_encryption_by_default {
  #       sse_algorithm = "AES256"
  #     }

  #     bucket_key_enabled = "true"
  #   }
  # }

  # versioning {
  #   enabled    = "false"
  #   mfa_delete = "false"
  # }
}

# import {
#   to = aws_s3_bucket.main
#   id = "octopuscloud"
#   # id = aws_s3_bucket.main.id
# }
