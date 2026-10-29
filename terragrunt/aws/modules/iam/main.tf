# Source: https://github.com/terraform-aws-modules/terraform-aws-iam

module "iam_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role"

  name = "AmazonEKS_EBS_CSI_DriverRole"

  trust_policy_permissions = {
    TrustRoleAndServiceToAssume = {
      actions = ["sts:AssumeRoleWithWebIdentity"]
      principals = [{
        type = "Federated"
        identifiers = [
          "${var.oidc_provider_arn}"
        ]
      }]
      condition = [{
        test         = "StringEquals"
        values       = ["sts.amazonaws.com"]
        variable     = "${var.oidc_provider_url}:aud"
      }]
    }
  }

  policies = {
    AmazonEBSCSIDriverPolicy   = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  }

  tags = {
    Resource = "terraform-aws-modules/iam/aws//modules/iam-role"
  }
}
