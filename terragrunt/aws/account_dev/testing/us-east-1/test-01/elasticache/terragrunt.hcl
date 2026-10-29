include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true # use exposed includes to reference data defined in the parent configurations
}

terraform{
  source = "../../../../../modules/elasticache"
}

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    vpc_id                  = "dummy-vpc-id-data"
    vpc_subnet_private_id_a = "dummy-subnet-id-data"
    vpc_subnet_private_id_b = "dummy-subnet-id-data"
  }
}

# set variables in variable.tf of the module, and then pass the values here in inputs block
inputs = {
  account_id                  = "${local.account_vars.locals.account_id}"
  aws_region                  = "${local.aws_region.locals.aws_region}"
  environment_name            = "${local.environment_vars.locals.project_name}-${local.local_vars.locals.env_name}-vpc"
  vpc_id                      = dependency.vpc.outputs.vpc_id
  vpc_name                    = "${local.environment_vars.locals.project_name}-${local.local_vars.locals.env_name}"
  vpc_subnet_private_id_a     = dependency.vpc.outputs.vpc_subnet_private_id_a
  vpc_subnet_private_id_b     = dependency.vpc.outputs.vpc_subnet_private_id_b
}

locals {
  environment_vars    = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  local_vars          = read_terragrunt_config(find_in_parent_folders("local.hcl"))
  account_vars        = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  aws_region          = read_terragrunt_config(find_in_parent_folders("region.hcl"))
}

# protect selected OpenTofu/Terraform module. It will prevent destroy or run --all destroy command from actually destroying resources of the protected module
prevent_destroy = false


### Testing Code, disable this run ###
# exclude {
#     if                      = true                                  # Boolean to determine exclusion.
#     no_run                  = true                                  # Boolean to prevent the unit from running (even when not using `--all`).
#     actions                 = ["init", "plan", "apply", "output"]   # List of actions to exclude (e.g., "plan", "apply", "all", "all_except_output").
#     # exclude_dependencies    = <boolean>                             # Boolean to determine if dependencies should also be excluded.
# }
