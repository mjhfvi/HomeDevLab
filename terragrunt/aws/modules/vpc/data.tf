data "aws_region" "current" {}

# Source: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc
data "aws_vpc" "this" {
    id = module.vpc.vpc_id
}

# Source: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet
data "aws_subnet" "private" {
    id = module.vpc.private_subnets[0]
}

data "aws_subnet" "public" {
    id = module.vpc.public_subnets[0]
}
