include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

terraform{
  source = "../../../../modules/virtual-machine//windows/"
}

dependency "resource_group" {
  config_path = "../resource-group"
}

dependency "key_vault" {
  config_path = "../key-vault"
}

dependency "subnet" {
  config_path = "../networking/subnet/vm-subnet"
}

dependency "public_ip_prefix" {
  config_path = "../networking/public-ip-prefix"
}

inputs = {
  resource_group_name = dependency.resource_group.outputs.name
  key_vault_id = dependency.key_vault.outputs.id
  subnet_id = dependency.subnet.outputs.id
  public_ip_prefix_id = dependency.public_ip_prefix.outputs.public_ip_prefix_id
  prefix_short = include.root.inputs.environment_prefix
  name = "win2022-01"
  size = "Standard_B2ms"
  install_iis = true
}

prevent_destroy = true
