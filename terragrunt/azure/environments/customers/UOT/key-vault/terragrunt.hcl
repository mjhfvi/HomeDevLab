include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

terraform{
  source = "../../../../modules/key-vault"
}

dependency "resource_group" {
  config_path = "../resource-group"
}

inputs = {
  resource_group_name = dependency.resource_group.outputs.name
  name = "b60c177f3ea6-vault"
  enable_rbac_authorization = false
}

prevent_destroy = true
