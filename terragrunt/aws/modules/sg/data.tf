# Source: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule
data "aws_security_groups" "ingress_with_cidr_blocks" {
    tags = {
        Environment = "development"
    }
}

# data "aws_security_group_rule" "ingress_with_cidr_blocks" {
#     id = module.security-group.aws_security_group_rule.ingress_with_cidr_blocks[0]

# }