# # Source: https://github.com/terraform-aws-modules/terraform-aws-vpc/blob/master/examples/block-public-access/outputs.tf

output "aws_opensearch_arn" {
  description = "The AWS OpenSearch ARN"
  value       = try(module.opensearch.domain_arn, "Validation: Unknown AWS OpenSearch ARN Output")
  sensitive   = false
}

output "aws_opensearch_dashboard_endpoint" {
  description = "The AWS OpenSearch Dashboard Endpoint"
  value       = try(module.opensearch.domain_dashboard_endpoint, "Validation: Unknown AWS OpenSearch Dashboard Endpoint Output")
  sensitive   = false
}

# output "aws_opensearch_engine_version" {
#     description = "The AWS OpenSearch Engine Version"
#     value       = try(module.opensearch.*, "Validation: Unknown AWS OpenSearch Engine Version Output")
#     sensitive   = false
# }

# output "aws_opensearch_dedicated_master_count" {
#     description = "The AWS OpenSearch Dedicated Master Count"
#     value       = try(module.opensearch.domain_dedicated_master_count, "Validation: Unknown AWS OpenSearch Dedicated Master Count Output")
#     sensitive   = false
# }

# output "aws_opensearch_dedicated_master_type" {
#     description = "The AWS OpenSearch Dedicated Master Type"
#     value       = try(module.opensearch.domain_dedicated_master_type, "Validation: Unknown AWS OpenSearch Dedicated Master Type Output")
#     sensitive   = false
# }

# output "aws_opensearch_instance_count" {
#     description = "The AWS OpenSearch Instance Count"
#     value       = try(module.opensearch.domain_instance_count, "Validation: Unknown AWS OpenSearch Instance Count Output")
#     sensitive   = false
# }

# output "aws_opensearch_instance_type" {
#     description = "The AWS OpenSearch Instance Type"
#     value       = try(module.opensearch.domain_instance_type, "Validation: Unknown AWS OpenSearch Instance Type Output")
#     sensitive   = false
# }
