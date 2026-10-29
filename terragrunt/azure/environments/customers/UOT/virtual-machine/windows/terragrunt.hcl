include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

terraform{
  source = "../../../../../modules/virtual-machine//windows/"
}

dependency "resource_group" {
  config_path = "../../resource-group"
}

dependency "key_vault" {
  config_path = "../../key-vault"
}

dependency "subnet" {
  config_path = "../../networking/subnet/vm-subnet"
}

inputs = {
  resource_group_name = dependency.resource_group.outputs.name
  key_vault_id = dependency.key_vault.outputs.id
  subnet_id = dependency.subnet.outputs.id
  prefix_short = include.root.inputs.environment_prefix
  name = "b60c177f3ea6"
  prefix_short = "vm"
  size = "Standard_F2s_v2"
  install_iis = false
}

prevent_destroy = true
