include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

terraform{
  source = "../../../../../modules/networking/public-ip-prefix"
}

dependency "resource_group" {
  config_path = "../../resource-group"
}

inputs = {
  resource_group_name = dependency.resource_group.outputs.name
  name="01"
}

prevent_destroy = true
