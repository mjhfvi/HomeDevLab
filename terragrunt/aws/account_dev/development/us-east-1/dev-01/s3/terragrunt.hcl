include "root" {
    path = find_in_parent_folders("root.hcl")
    expose = true
}

terraform{
    source = "../../../../../modules/s3"
}

inputs = {
    s3_bucket_name = "${local.environment_vars.locals.project_name}-${local.local_vars.locals.env_name}-data"

}

locals {
    environment_vars    = read_terragrunt_config(find_in_parent_folders("env.hcl"))
    local_vars          = read_terragrunt_config(find_in_parent_folders("local.hcl"))
}

### Testing Code, disable this run ###
# exclude {
#     if                   = true         # Boolean to determine exclusion.
#     no_run               = true         # Boolean to prevent the unit from running (even when not using `--all`).
#     actions              = ["init", "plan", "apply", "output"] # List of actions to exclude (e.g., "plan", "apply", "all", "all_except_output").
#     # exclude_dependencies = <boolean>         # Boolean to determine if dependencies should also be excluded.
# }

# prevent_destroy = true
