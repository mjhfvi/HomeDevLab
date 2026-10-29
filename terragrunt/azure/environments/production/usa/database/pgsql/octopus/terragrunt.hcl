include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

terraform{
  source = "../../../../../../modules/database/pgsql"
}

dependency "resource_group" {
  config_path = "../../../resource-group"
}

dependency "assigned_identity" {
  config_path = "../../../user-assigned-identity/pgsql-octopus"
}

dependency "key_vault" {
  config_path = "../../../key-vault"
}

dependency "vnet" {
  config_path = "../../../networking/virtual-network"
}

dependency "subnet" {
  config_path = "../../../networking/subnet/vm-subnet"
}

inputs = {
  resource_group_name = dependency.resource_group.outputs.name
  assigned_identity = dependency.assigned_identity.outputs.id
  key_vault_id = dependency.key_vault.outputs.id
  virtual_network_id = dependency.vnet.outputs.id
  virtual_network_subnet_id = dependency.subnet.outputs.id
  name = "octopus"
  
}

prevent_destroy = true
