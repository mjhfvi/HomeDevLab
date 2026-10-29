locals {
  account_vars       = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars        = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  environment_vars   = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  # global_vars = read_terragrunt_config(find_in_parent_folders("global.hcl"))
  aws_profile        = local.environment_vars.locals.aws_profile_name
  aws_region         = local.region_vars.locals.aws_region
  office_ip_address  = "x.x.x.x/32"
  creation_timestamp = timestamp()
  config = {
    user_name = get_env("USER", "automation")
  }
}

inputs = {
  office_ip_address = local.office_ip_address
  aws_region        = local.aws_region
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
    aws = {
      source  = "hashicorp/aws" # https://registry.terraform.io/providers/hashicorp/aws/latest
      version = "~> 6.19"
    }
    random = {
      source  = "hashicorp/random" # https://registry.terraform.io/providers/hashicorp/random/latest
      version = "~> 3.7.2"
    }
    tls = {
      source  = "hashicorp/tls" # https://registry.terraform.io/providers/hashicorp/tls/latest
      version = "~> 4.1"
    }
    local = {
      source  = "hashicorp/local" # https://registry.terraform.io/providers/hashicorp/local/latest
      version = "~> 2.5.3"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes" # https://registry.terraform.io/providers/hashicorp/kubernetes/latest
      version = "~> 2.38.0"
    }
    # helm = {
    #   source  = "hashicorp/helm" # https://registry.terraform.io/providers/hashicorp/helm/latest
    #   version = "~> 3.1.1"
    # }
  }
  required_version = ">= 1.13.1" # https://github.com/hashicorp/terraform/releases
}

provider "aws" {
    profile = "${local.aws_profile}"
    region  = "${local.region_vars.locals.aws_region}"
    default_tags {
        tags = {
            Owner               = "devops"
            BuildTool           = "terragrunt"
            BuildBy             = "${local.config.user_name}"
            Project             = "${local.environment_vars.locals.project_name}"
            Environment         = "${local.environment_vars.locals.environment}"
            Prefix              = "${local.environment_vars.locals.project_name}-${local.environment_vars.locals.environment_prefix}-${local.region_vars.locals.region_prefix}"
            PrefixLong          = "${local.environment_vars.locals.project_name}-${local.environment_vars.locals.environment}-${local.region_vars.locals.aws_region}"
            UsedFor             = "${local.environment_vars.locals.used_for}"
            # CreationDate        = "${local.creation_timestamp}" # Change the value to 'run_once'
            # TerraformVersion    = terraform.version.required_version
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
