# # Source: https://github.com/terraform-aws-modules/terraform-aws-vpc/blob/master/examples/block-public-access/outputs.tf

output "sg_ingress_with_cidr_blocks" {
    description = "Security Groups Ingress IDs"
    value       = try(data.aws_security_groups.ingress_with_cidr_blocks.ids, "Validation: Unknown Security Groups Ingress IDs Output")
    sensitive   = false
}
