locals {
    account_vars        = read_terragrunt_config(find_in_parent_folders("account.hcl"))
    region_vars         = read_terragrunt_config(find_in_parent_folders("region.hcl"))
    environment_vars    = read_terragrunt_config(find_in_parent_folders("env.hcl"))
    # global_vars = read_terragrunt_config(find_in_parent_folders("global.hcl"))
    aws_profile         = local.environment_vars.locals.aws_profile_name
    aws_region          = "${local.region_vars.locals.aws_region}"
    environment_name    = "${local.environment_vars.locals.project_name}-${local.environment_vars.locals.environment}"
    office_ip_address   = "x.x.x.x/32"
    config = {
        user_name = get_env("USER", "automation")
    }
}

inputs = {
    office_ip_address   = local.office_ip_address
    environment_name    = local.environment_name
    aws_region          = local.aws_region
}

terraform {
    extra_arguments "aws_profile" {
        commands = [
            "init",
            "apply",
            "refresh",
            "import",
            "plan",
            "taint",
            "untaint"
        ]

        env_vars = {
            AWS_PROFILE = "${local.aws_profile}"
        }
    }
}

remote_state {
    backend = "s3"
    generate = {
        path      = "backend.tf"
        if_exists = "overwrite"
    }
    config = {
        bucket  = "account-devops-bucket"
        key     = "${path_relative_to_include("env")}/terraform.tfstate"
        region  = "ca-central-1"
        encrypt = true
        profile = "account_devops"
    }
}

generate "provider" {
    path      = "provider.tf"
    if_exists = "overwrite"
    contents  = <<EOF
terraform {
    required_providers {
        cloudflare = {
            source  = "cloudflare/cloudflare"
            version = "~> 5.10.1"
        }
    }
    # required_version = ">= 1.6.6"
}

provider "cloudflare" {
    profile = "${local.aws_profile}"
    region  = "${local.region_vars.locals.aws_region}"
    default_tags {
        tags = {
            Owner       = "devops"
            BuildTool   = "terragrunt"
            BuildBy     = "${local.config.user_name}"
            Project     = "${local.environment_vars.locals.project_name}"
            Environment = "${local.environment_vars.locals.environment}"
            Prefix      = "${local.environment_vars.locals.project_name}-${local.environment_vars.locals.environment_prefix}-${local.region_vars.locals.region_prefix}"
            PrefixLong  = "${local.environment_vars.locals.project_name}-${local.environment_vars.locals.environment}-${local.region_vars.locals.aws_region}"
            }
        }
    }
EOF
}

# inputs = merge(
#     local.account_vars.locals,
#     local.region_vars.locals,
#     local.environment_vars.locals,
#     {
#         project_name = "${local.global_vars.locals.project_name}"
#         prefix = "${local.global_vars.locals.project_name}-${local.environment_vars.locals.environment_prefix}-${local.region_vars.locals.region_prefix}"
#         prefix_long = "${local.global_vars.locals.project_name}-${local.environment_vars.locals.environment}-${local.region_vars.locals.aws_region}"
#     }
# )
