include "root" {
    path = find_in_parent_folders("root.hcl")
    expose = true
}

terraform{
    source = "../../../../../modules/opensearch"
}

dependency "vpc" {
    config_path = "../vpc"

    mock_outputs = {
        vpc_id              = "dummy-vpc-id-data"
        domain_name         = "dummy-opensearch-domain-name-data"
    }
}

inputs = {
    vpc_id                   = dependency.vpc.outputs.vpc_id
    engine_version           = "OpenSearch_3.1"
    domain_name              = "octopus"
    master_user_name         = "user"
    master_user_password     = "Octo5us!"
    instance_count           = 2
    dedicated_master_type    = "m8g.medium.search" # Autotune is not supported in t2/t3 instance types # https://aws.amazon.com/opensearch-service/pricing/
    instance_type            = "m8g.medium.search" # Autotune is not supported in t2/t3 instance types # https://aws.amazon.com/opensearch-service/pricing/
}

### Testing Code, disable this run ###
# exclude {
#     if                   = true         # Boolean to determine exclusion.
#     no_run               = true         # Boolean to prevent the unit from running (even when not using `--all`).
#     actions              = ["init", "plan", "apply", "output"] # List of actions to exclude (e.g., "plan", "apply", "all", "all_except_output").
#     # exclude_dependencies = <boolean>         # Boolean to determine if dependencies should also be excluded.
# }

# prevent_destroy = true
