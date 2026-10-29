# Source: https://github.com/terraform-aws-modules/terraform-aws-vpc/blob/master/examples/block-public-access/outputs.tf

output "aws_region" {
  description = "The AWS Region of the VPC"
  value       = try(data.aws_region.current.id, "Validation: Unknown VPC Region Output")
  sensitive   = false
}

output "vpc_name" {
  description = "The Name of the VPC"
  value       = try(data.aws_vpc.this.tags.Name, "Validation: Unknown VPC Name Output")
  sensitive   = false
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = try(module.vpc.vpc_id, "Validation: Unknown VPC ID Output")
  sensitive   = false
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = try(module.vpc.vpc_arn, "Validation: Unknown VPC ARN Output")
  sensitive   = false
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = try(module.vpc.vpc_cidr_block, "Validation: Unknown VPC CIDR block Output")
  sensitive   = false
}

output "vpc_subnet_private_id_a" {
  description = "The ID of the private Subnet a"
  value       = try(module.vpc.private_subnets[0], "Validation: Unknown VPC Private Subnet ID a Output")
  sensitive   = false
}

output "vpc_subnet_private_id_b" {
  description = "The ID of the private Subnet b"
  value       = try(module.vpc.private_subnets[1], "Validation: Unknown VPC Private Subnet ID b Output")
  sensitive   = false
}

output "vpc_subnet_public_id_a" {
  description = "The ID of the public Subnet a"
  value       = try(module.vpc.public_subnets[0], "Validation: Unknown VPC Public Subnet ID a Output")
  sensitive   = false
}

output "vpc_subnet_public_id_b" {
  description = "The ID of the public Subnet b"
  value       = try(module.vpc.public_subnets[1], "Validation: Unknown VPC Public Subnet ID b Output")
  sensitive   = false
}

output "vpc_available_ip_address_count" {
  description = "The Number of available IP addresses in the VPC"
  value       = try(data.aws_subnet.private.available_ip_address_count, "Validation: Unknown VPC Available IP Address Count Output")
  sensitive   = false
}

output "vpc_default_security_group_ids" {
  description = "The IDs of the VPC Security Groups"
  value       = try(module.vpc.default_security_group_id, "Validation: Unknown VPC Security Group IDs Output")
  sensitive   = false
}

output "database_subnet_group_name" {
  description = "The Name of the Database Subnet Group"
  value       = try(module.vpc.database_subnet_group_name, "Validation: Unknown Database Subnet Group Name Output")
  sensitive   = false

}
# show output command: terragrunt --experiment stacks output
