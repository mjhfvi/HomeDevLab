include "root" {
  path    = find_in_parent_folders("root.hcl")
  expose  = true
}

terraform{
  source = "../../../../../../modules/networking//peering"
}

dependency "resource_group" {
  config_path = "../../../resource-group"
}

dependency "source_vnet" {
  config_path = "../../virtual-network"
}

dependency "remote_vnet" {
  config_path = "../../../../europe/networking/virtual-network"
}

inputs = {
  resource_group_name         = dependency.resource_group.outputs.name
  virtual_network_name        = dependency.source_vnet.outputs.name
  remote_virtual_network_id   = dependency.remote_vnet.outputs.id
  remote_virtual_network_name = dependency.remote_vnet.outputs.name
}

prevent_destroy = true
