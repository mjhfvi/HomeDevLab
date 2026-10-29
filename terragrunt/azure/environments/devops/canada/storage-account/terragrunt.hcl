include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

terraform{
  source = "../../../../modules//storage-account/"
}

dependency "resource_group" {
  config_path = "../resource-group"
}

inputs = {
  resource_group_name       = dependency.resource_group.outputs.name
  name                      = "octopusdevops",
  account_replication_type  = "LRS"
}

prevent_destroy = true
