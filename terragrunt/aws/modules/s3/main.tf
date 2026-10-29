module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket        = var.s3_bucket_name
  create_bucket = var.create_bucket
  acl           = "private"

  control_object_ownership  = true
  object_ownership          = "ObjectWriter"
  force_destroy             = false

  versioning = {
    enabled = true
  }

  tags = {
    Resource = "terraform-aws-modules/s3-bucket/aws"
  }
}

# resource "aws_s3_bucket" "main" {
#   bucket        = "octopuscloud"
#   force_destroy = "false"

#   # grant {
#   #   id          = "6a69b488cfd3cc4ef1b65cd778d7fc702589fdde429bea40116a9a6ff73d8f01"
#   #   permissions = ["FULL_CONTROL"]
#   #   type        = "CanonicalUser"
#   # }

#   object_lock_enabled = "false"
#   region              = var.aws_region # Optional, defaults to the region of the provider us-east-1
#   # request_payer       = "BucketOwner"

#   # server_side_encryption_configuration {
#   #   rule {
#   #     apply_server_side_encryption_by_default {
#   #       sse_algorithm = "AES256"
#   #     }

#   #     bucket_key_enabled = "true"
#   #   }
#   # }

#   # versioning {
#   #   enabled    = "false"
#   #   mfa_delete = "false"
#   # }
# }

# # import {
# #   to = aws_s3_bucket.main
# #   id = "octopuscloud"
# #   # id = aws_s3_bucket.main.id
# # }
