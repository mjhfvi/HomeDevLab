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
  resource_group_name    = dependency.resource_group.outputs.name
  virtual_network_name   = dependency.vnet.outputs.name
  override_resource_name = true
  name                   = "GatewaySubnet"
  address_prefixes       = ["172.16.1.0/24"]
}

prevent_destroy = true
