resource "aws_eip" "lb" {
  domain               = "vpc"
  instance             = aws_instance.ec2.id
  network_border_group = "us-east-1"
  network_interface    = "eni-0577ba754b3712586"
  public_ipv4_pool     = "amazon"
  region               = "us-east-1"
}

# resource "aws_eip" "eipalloc-088f07554b41d432e" {
#   domain               = "vpc"
#   network_border_group = "us-east-1"
#   network_interface    = "eni-002ecb84f4a02988e"
#   public_ipv4_pool     = "amazon"
#   region               = "us-east-1"

#   tags = {
#     Name                                          = "eksctl-videochat-prod-cluster/NATIP"
#     "alpha.eksctl.io/cluster-name"                = "videochat-prod"
#     "alpha.eksctl.io/cluster-oidc-enabled"        = "false"
#     "alpha.eksctl.io/eksctl-version"              = "0.167.0"
#     "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "videochat-prod"
#   }
# }

# resource "aws_eip" "eipalloc-0defc0a561f58d3de" {
#   domain               = "vpc"
#   network_border_group = "us-east-1"
#   public_ipv4_pool     = "amazon"
#   region               = "us-east-1"
# }
