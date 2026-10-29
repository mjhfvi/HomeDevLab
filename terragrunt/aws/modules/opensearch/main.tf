# Source: https://github.com/terraform-aws-modules/terraform-aws-opensearch

module "opensearch" {
  source  = "terraform-aws-modules/opensearch/aws"
  version = "2.1.1"

  engine_version = var.engine_version # set to terragrunt.hcl
  domain_name    = var.domain_name    # set to terragrunt.hcl

  advanced_security_options = {
    enabled                        = true
    anonymous_auth_enabled         = false
    internal_user_database_enabled = true

    master_user_options = {
      master_user_name     = var.master_user_name     # set to terragrunt.hcl
      master_user_password = var.master_user_password # set to terragrunt.hcl
    }
  }

  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  auto_tune_options = {
    desired_state = "ENABLED"

    maintenance_schedule = [
      {
        start_at                       = "2028-05-13T07:44:12Z"
        cron_expression_for_recurrence = "cron(0 0 ? * 1 *)"
        duration = {
          value = "2"
          unit  = "HOURS"
        }
      }
    ]

    rollback_on_disable = "NO_ROLLBACK"
  }

  cluster_config = {
    instance_count           = var.instance_count # set to terragrunt.hcl
    dedicated_master_enabled = true
    dedicated_master_type    = var.dedicated_master_type # set to terragrunt.hcl
    instance_type            = var.instance_type         # set to terragrunt.hcl

    zone_awareness_config = {
      availability_zone_count = 2
    }

    zone_awareness_enabled = true
  }

  domain_endpoint_options = {
    enforce_https       = true
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
  }

  ebs_options = {
    ebs_enabled = true
    iops        = 3000
    throughput  = 125
    volume_type = "gp3"
    volume_size = var.ebs_options_volume_size
  }

  encrypt_at_rest = {
    enabled = true
  }

  log_publishing_options = [
    { log_type = "INDEX_SLOW_LOGS" },
    { log_type = "SEARCH_SLOW_LOGS" },
  ]

  node_to_node_encryption = {
    enabled = true
  }

  software_update_options = {
    auto_software_update_enabled = true
  }

  # VPC Options: You must specify exactly two subnets because you’ve set zone count to two
  vpc_options = {
    subnet_ids = [var.vpc_subnet_public_id_a, var.vpc_subnet_public_id_b]
  }

  # vpc_endpoints = {
  #   one = {
  #     subnet_ids = [var.vpc_subnet_private_id_a, var.vpc_subnet_private_id_b]
  #   }
  # }

  # Security Group rule example
  security_group_rules = {
    ingress_443 = {
      type        = "ingress"
      description = "HTTPS access from VPC"
      from_port   = 443
      to_port     = 443
      ip_protocol = "tcp"
      cidr_ipv4   = var.office_ip_address
    },
    ingress_80 = {
      type        = "ingress"
      description = "HTTP access from VPC"
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      cidr_ipv4   = var.office_ip_address
    }
  }

  ## Access policy
  access_policy_statements = [
    {
      effect = "Allow"

      principals = [{
        type        = "*"
        identifiers = ["*"]
      }]

      actions  = ["es:*"]
      resource = "arn:aws:es:${var.aws_region}:${var.account_id}:domain/${var.domain_name}/*"

      # conditions = [{
      #   test     = "IpAddress"
      #   variable = "aws:SourceIp"
      #   values   = ["127.0.0.1/32"]
      # }]
    }
  ]

  tags = {
    Resources = "terraform-aws-modules/opensearch/aws"
  }
}
