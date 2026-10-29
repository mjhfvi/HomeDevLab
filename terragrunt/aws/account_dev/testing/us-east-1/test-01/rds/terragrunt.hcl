include "root" {
    path = find_in_parent_folders("root.hcl")
    expose = true
}

terraform{
    source = "../../../../../modules/rds"
}

# dependency "vpc" {
#     config_path = "../vpc"

#     mock_outputs = {
#         vpc_id              = "dummy-vpc-id-data"
#         # subnet_private_id   = "dummy-subnet-id-data"
#     }
# }

inputs = {
    # vpc_id                   = dependency.vpc.outputs.vpc_id
    # subnet_private_id        = dependency.vpc.outputs.subnet_private_id
    identifier              = "demodb"
    engine_version          = "5.7"
    instance_class          = "db.t3a.large"
    db_name                 = "demodb"
    username                = "user"
    family                  = "mysql5.7"
    major_engine_version    = "5.7"
}

### Testing Code, disable this run ###
# exclude {
#     if                   = true         # Boolean to determine exclusion.
#     no_run               = true         # Boolean to prevent the unit from running (even when not using `--all`).
#     actions              = ["init", "plan", "apply", "output"] # List of actions to exclude (e.g., "plan", "apply", "all", "all_except_output").
#     # exclude_dependencies = <boolean>         # Boolean to determine if dependencies should also be excluded.
# }

# prevent_destroy = true
