include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

terraform{
  source = "../../../../modules//app-service-plan"
}

dependency "resource_group"{
  config_path = "../resource-group"
}

dependencies {
  paths = ["../resource-group"]
}

inputs = {
  resource_group_name = dependency.resource_group.outputs.name
  os_type             = "Linux"
  name                = "01"
  sku_name            = "B1"
}

prevent_destroy = true