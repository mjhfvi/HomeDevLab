terraform{
  source = "../../../../../modules/networking/virtual-network"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

dependency "resource_group" {
  config_path = "../../resource-group"
}

inputs = {
   resource_group_name = dependency.resource_group.outputs.name
   name                = "${include.root.inputs.prefix_long}-b60c177f3ea6"
   address_space       = ["172.16.0.0/23"]
}

prevent_destroy = true
