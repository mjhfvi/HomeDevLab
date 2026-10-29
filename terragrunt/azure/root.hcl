locals {
  account_vars     = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars      = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  global_vars      = read_terragrunt_config(find_in_parent_folders("global.hcl"))
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.7"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
  required_version = ">= 1.8.0"
}
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
  tenant_id           = ""
  subscription_id     = ""
  storage_use_azuread = true
}
EOF
}

remote_state {
  backend = "azurerm"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    subscription_id      = local.account_vars.locals.subscription_id
    resource_group_name  = "account-devops-canadacentral"
    storage_account_name = "accountdevops"
    container_name       = "terraform-state"
    key                  = "${path_relative_to_include("env")}/terraform.tfstate"
    use_azuread_auth     = true
  }
}

terraform {
  extra_arguments "retry_lock" {
    commands = get_terraform_commands_that_need_locking()

    arguments = [
      "-lock-timeout=20m"
    ]
  }
}

inputs = merge(
  local.region_vars.locals,
  local.environment_vars.locals,
  {
    project_name      = local.global_vars.locals.project_name
    prefix            = "${local.global_vars.locals.project_name}-${local.environment_vars.locals.environment_prefix}-${local.region_vars.locals.location_prefix}"
    prefix_long       = "${local.global_vars.locals.project_name}-${local.environment_vars.locals.environment}-${local.region_vars.locals.location}"
    office_ip_address = "x.x.x.x/32"
    tags = {
      source      = "terraform"
      environment = local.environment_vars.locals.environment
    }
    tenant_id       = local.account_vars.locals.tenant_id,
    subscription_id = local.account_vars.locals.subscription_id
  }
)
