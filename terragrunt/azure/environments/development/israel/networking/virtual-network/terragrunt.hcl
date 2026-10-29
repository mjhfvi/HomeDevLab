include "root" {
  path    = find_in_parent_folders("root.hcl")
  expose  = true
}

terraform{
  source = "../../../../../modules/networking//virtual-network"
}
dependency "resource_group" {
  config_path = "../../resource-group"
}

inputs = {
  resource_group_name = dependency.resource_group.outputs.name
  name                = include.root.inputs.prefix_long
  address_space       = ["172.17.0.0/23"]
}

prevent_destroy = true
