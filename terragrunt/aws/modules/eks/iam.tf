# Source: https://github.com/terraform-aws-modules/terraform-aws-iam

module "iam_role_ebs_driver" {
  source = "terraform-aws-modules/iam/aws//modules/iam-role"

  name        = "AmazonEKS_EBS_CSI_DriverRole"
  description = "IAM Role for EKS EBS CSI Driver"

  depends_on = [module.eks]

  trust_policy_permissions = {
    TrustRoleAndServiceToAssume = {
      actions = ["sts:AssumeRoleWithWebIdentity"]
      principals = [{
        type = "Federated"
        identifiers = [
          "${module.eks.oidc_provider_arn}"
        ]
      }]
      condition = [{
        test     = "StringEquals"
        values   = ["sts.amazonaws.com"]
        variable = "oidc.eks.${var.aws_region}.amazonaws.com/id/${local.cluster_url}:aud"
      }]
    }
  }

  policies = {
    AmazonEBSCSIDriverPolicy = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  }

  tags = {
    Resource = "terraform-aws-modules/iam/aws//modules/iam-role"
  }
}

module "iam_role_crossplane_provider" {
  source = "terraform-aws-modules/iam/aws//modules/iam-role"

  name        = "AmazonEKS_Crossplane_ProviderRole"
  description = "IAM Role for EKS Crossplane Provider"

  depends_on = [module.eks]

  trust_policy_permissions = {
    TrustRoleAndServiceToAssume = {
      actions = ["sts:AssumeRoleWithWebIdentity"]
      principals = [{
        type = "Federated"
        identifiers = [
          "${module.eks.oidc_provider_arn}"
        ]
      }]
      condition = [{
        test     = "StringEquals"
        values   = ["sts.amazonaws.com"]
        variable = "oidc.eks.${var.aws_region}.amazonaws.com/id/${local.cluster_url}:aud"
      }]
    }
  }

  policies = {
    AdministratorAccess = "arn:aws:iam::aws:policy/AdministratorAccess"
  }

  tags = {
    Resource = "terraform-aws-modules/iam/aws//modules/iam-role"
  }
}

############# IAM User for Crossplane #############

module "iam_crossplane_user" {
  source = "terraform-aws-modules/iam/aws//modules/iam-user"

  name = "crossplane_user"

  create_login_profile = false
  create_access_key    = true
  access_key_status    = "Active" # Set the access key status to "Active" to ensure it is usable immediately

  tags = {
    Resource = "terraform-aws-modules/iam/aws//modules/iam-user"
  }
}

resource "local_file" "credentials_ini" {
  content = <<-EOT
    [default]
    aws_access_key_id = ${module.iam_crossplane_user.access_key_id}
    aws_secret_access_key = ${module.iam_crossplane_user.access_key_secret}
  EOT
  filename = var.credentials_file_path

  lifecycle {
    ignore_changes = [
      content # Ignore changes to the content to prevent overwriting the file with new credentials on every apply
    ]
  }
}

############# EKS openid number from connect provider #############
locals {
  # Remove "https://" prefix
  without_protocol = replace(module.eks.cluster_endpoint, "https://", "")

  # Split by "." and take first part
  cluster_url = split(".", local.without_protocol)[0]
}
