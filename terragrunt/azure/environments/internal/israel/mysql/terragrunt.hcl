include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

terraform{
  source = "../../../../modules/database//mysql/"
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

dependency "identity" {
  config_path = "../identity/mysql"
}

dependency "private-dns-zone" {
  config_path = "../private-dns-zone/mysql"
}

inputs = {
  resource_group_name       = dependency.resource_group.outputs.name
  virtual_network_subnet_id = dependency.subnet.outputs.id
  private_dns_zone_id       = dependency.private-dns-zone.outputs.id
  key_vault_id              = dependency.key_vault.outputs.id
  assigned_identity         = [dependency.identity.outputs.id]
  name                      = "01"
  databases                 = ["octopus_helpdesk", "octopus_it"]
}

prevent_destroy = true
