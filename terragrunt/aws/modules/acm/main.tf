# Source: https://github.com/terraform-aws-modules/terraform-aws-acm

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name  = "connection.octomedia.live"
  zone_id      = "Z2ES7B9AZ6SHAE" # ID of the hosted zone to contain this record

  validation_method = "DNS"

  subject_alternative_names = [
    ".octomedia.live"
  ]

  wait_for_validation = true

  validation_record_fqdns = [
    "_689571ee9a5f9ec307c512c5d851e25a.octomedia.live",
  ]

  tags = {
    Resource = "terraform-aws-acm"
  }
}