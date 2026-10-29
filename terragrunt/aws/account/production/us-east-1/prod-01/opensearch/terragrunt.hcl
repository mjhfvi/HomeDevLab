include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

terraform {
  source = "../../../../../modules/opensearch"
}

locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  local_vars       = read_terragrunt_config(find_in_parent_folders("local.hcl"))
}

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    vpc_id                  = "dummy-vpc-id-data"
    domain_name             = "dummy-opensearch-domain-name-data"
    vpc_subnet_private_id_a = "dummy-private-subnet-a-data"
    vpc_subnet_private_id_b = "dummy-private-subnet-b-data"
    vpc_subnet_public_id_a  = "dummy-public-subnet-a-data"
    vpc_subnet_public_id_b  = "dummy-public-subnet-b-data"
  }
}

# set in variable.tf
inputs = {
  vpc_id                  = dependency.vpc.outputs.vpc_id
  engine_version          = "OpenSearch_3.3"
  domain_name             = "${local.environment_vars.locals.project_name}-${local.local_vars.locals.env_name}-opensearch"
  master_user_name        = "user"
  master_user_password    = "Octo5us!"
  instance_count          = "2"
  ebs_options_volume_size = "100"
  dedicated_master_type   = "m8g.medium.search" # "c6g.large.search", Autotune is not supported in t2/t3 instance types # https://aws.amazon.com/opensearch-service/pricing/
  instance_type           = "m8g.medium.search" # "c6g.large.search", Autotune is not supported in t2/t3 instance types # https://aws.amazon.com/opensearch-service/pricing/
  vpc_subnet_private_id_a = dependency.vpc.outputs.vpc_subnet_private_id_a
  vpc_subnet_private_id_b = dependency.vpc.outputs.vpc_subnet_private_id_b
  vpc_subnet_public_id_a  = dependency.vpc.outputs.vpc_subnet_public_id_a
  vpc_subnet_public_id_b  = dependency.vpc.outputs.vpc_subnet_public_id_b
}

prevent_destroy = false

### Testing Code, disable this run ###
# exclude {
#     if                   = true         # Boolean to determine exclusion.
#     no_run               = true         # Boolean to prevent the unit from running (even when not using `--all`).
#     actions              = ["init", "plan", "apply", "output"] # List of actions to exclude (e.g., "plan", "apply", "all", "all_except_output").
#     # exclude_dependencies = <boolean>         # Boolean to determine if dependencies should also be excluded.
# }

