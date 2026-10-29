# Source: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster

# data "aws_eks_cluster" "main" {
#     name = var.name
# }

data "aws_availability_zones" "available" {
  # Exclude local zones
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# data "aws_eks_cluster" "this" {
#   name = module.eks.cluster_name
# }

# data "aws_iam_openid_connect_provider" "this" {
#   url = data.aws_eks_cluster.this.identity[0].oidc[0].issuer
# }

# data "instance_types" "eks" {
#   filter {
#     name   = "instance-type"
#     # values = ["t3.medium", "t3.large", "t3.xlarge", "t3.2xlarge"]
#   }

# }