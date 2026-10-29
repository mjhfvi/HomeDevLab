include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

terraform {
  source = "../../../../../modules/eks"
}

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    vpc_id                  = "dummy-vpc-id-data"
    vpc_subnet_private_id_a = "dummy-subnet-id-data"
    vpc_subnet_private_id_b = "dummy-subnet-id-data"
  }
}

inputs = {
  vpc_id                  = dependency.vpc.outputs.vpc_id
  vpc_subnet_private_id_a = dependency.vpc.outputs.vpc_subnet_private_id_a
  vpc_subnet_private_id_b = dependency.vpc.outputs.vpc_subnet_private_id_b
  name                    = "${local.environment_vars.locals.project_name}-${local.local_vars.locals.env_name}"
  kubernetes_version      = "1.34"
  account_id              = local.account_vars.locals.account_id
}

locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  local_vars       = read_terragrunt_config(find_in_parent_folders("local.hcl"))
  account_vars     = read_terragrunt_config(find_in_parent_folders("account.hcl"))
}

prevent_destroy = true


### Testing Code, disable this run ###
# exclude {
#     if                   = true         # Boolean to determine exclusion.
#     no_run               = true         # Boolean to prevent the unit from running (even when not using `--all`).
#     actions              = ["init", "plan", "apply", "output"] # List of actions to exclude (e.g., "plan", "apply", "all", "all_except_output").
#     # exclude_dependencies = <boolean>         # Boolean to determine if dependencies should also be excluded.
# }
