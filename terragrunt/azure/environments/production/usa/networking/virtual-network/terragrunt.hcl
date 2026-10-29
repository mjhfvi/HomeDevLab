include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

terraform{
  source = "../../../../../modules/networking/virtual-network"
}

dependency "resource_group" {
  config_path = "../../resource-group"
}

inputs = {
  resource_group_name = dependency.resource_group.outputs.name
  name="octopus-production"
}

prevent_destroy = true
