include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true # use exposed includes to reference data defined in the parent configurations
}

terraform{
  source = "../../../../../modules/rds"
}

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    vpc_id                          = "dummy-vpc-id-data"
    vpc_subnet_private_id_a         = "dummy-subnet-id-data"
    vpc_subnet_private_id_b         = "dummy-subnet-id-data"
    vpc_default_security_group_ids  = "dummy-security-group-id-data"
    database_subnet_group_name      = "dummy-db-subnet-group-name-data"
  }
}

# set variables in variable.tf of the module, and then pass the values here in inputs block
inputs = {
  vpc_id                          = dependency.vpc.outputs.vpc_id
  # db_subnet_group_name            = "${local.environment_vars.locals.project_name}-${local.local_vars.locals.env_name}-db-subnet-group"
  db_subnet_group_name            = dependency.vpc.outputs.database_subnet_group_name
  vpc_default_security_group_ids  = [dependency.vpc.outputs.vpc_default_security_group_ids]
  deletion_protection             = true
  identifier                      = "${local.environment_vars.locals.project_name}-${local.local_vars.locals.env_name}-rds-instance"
  create_db_instance              = true
  instance_class                  = "db.t4g.large"
  db_name                         = "completePostgresql"
  username                        = "complete_postgresql"
  allocated_storage               = "20"
}

locals {
  environment_vars    = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  local_vars          = read_terragrunt_config(find_in_parent_folders("local.hcl"))
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
