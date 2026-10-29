include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true # use exposed includes to reference data defined in the parent configurations
}

terraform{
  source = "../../../../../modules/s3"
}

# set variables in variable.tf of the module, and then pass the values here in inputs block
inputs = {
  s3_bucket_name = "${local.environment_vars.locals.project_name}-${local.local_vars.locals.env_name}-${local.region_vars.locals.aws_region}-logs"
  create_bucket  = true
  region         = local.region_vars.locals.aws_region
}

locals {
  environment_vars    = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  local_vars          = read_terragrunt_config(find_in_parent_folders("local.hcl"))
  region_vars         = read_terragrunt_config(find_in_parent_folders("region.hcl"))
}

# protect selected OpenTofu/Terraform module. It will prevent destroy or run --all destroy command from actually destroying resources of the protected module
prevent_destroy = true

### Testing Code, disable this run ###
# exclude {
#     if                   = true         # Boolean to determine exclusion.
#     no_run               = true         # Boolean to prevent the unit from running (even when not using `--all`).
#     actions              = ["init", "plan", "apply", "output"] # List of actions to exclude (e.g., "plan", "apply", "all", "all_except_output").
#     # exclude_dependencies = <boolean>         # Boolean to determine if dependencies should also be excluded.
# }
