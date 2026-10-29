include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

terraform{
  source = "../../../../../../modules/networking//subnet"
}

dependency "resource_group" {
  config_path = "../../../resource-group"
}

dependency "vnet" {
  config_path = "../../virtual-network"
}

inputs = {
  resource_group_name   = dependency.resource_group.outputs.name
  virtual_network_name  = dependency.vnet.outputs.name
  prefix                = "${include.root.inputs.project_name}-${include.root.inputs.environment}"
  name                  = "virtual-machines"
  address_prefixes      = ["172.16.0.0/28"]
}

prevent_destroy = true
