# Resource: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway

resource "aws_internet_gateway" "gw" {
    vpc_id = var.vpc_id

    tags = {
        Resource = "aws_internet_gateway/gw"
    }
}
