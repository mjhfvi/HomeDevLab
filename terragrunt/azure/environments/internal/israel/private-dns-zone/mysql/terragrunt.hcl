include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

terraform{
  source = "../../../../../modules//private-dns-zone"
}

dependency "resource_group" {
  config_path = "../../resource-group"
}

dependency "vnet" {
  config_path = "../../networking/virtual-network"
}

inputs = {
  resource_group_name = dependency.resource_group.outputs.name
  virtual_network_id  = dependency.vnet.outputs.id
  name                = "mysql.database.azure.com"
}

prevent_destroy = true
