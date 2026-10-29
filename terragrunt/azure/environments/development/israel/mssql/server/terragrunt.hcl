include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

terraform{
  source = "../../../../../modules/database/mssql//server/"
}

dependency "resource_group" {
  config_path = "../../resource-group"
}

dependency "key_vault" {
  config_path = "../../key-vault"
}


inputs = {
  resource_group_name  = dependency.resource_group.outputs.name
  key_vault_id         = dependency.key_vault.outputs.id
  name                 = "srv"
}

prevent_destroy = true
