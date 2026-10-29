Source: https://github.com/terraform-aws-modules/terraform-aws-pricing

provider "aws" {
  region = "us-east-1"
}

module "pricing" {
  source = "terraform-aws-modules/pricing/aws//modules/pricing"

  # content can be Terraform state or plan as JSON fetched from any source (see examples)
  content = jsondecode("{\"version\": 4, \"terraform_version\": \"0.14.4\", ...")
}