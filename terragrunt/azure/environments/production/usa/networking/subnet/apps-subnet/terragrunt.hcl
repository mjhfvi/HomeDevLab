include "root" {
  path    = find_in_parent_folders("root.hcl")
  expose  = true
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
  resource_group_name = dependency.resource_group.outputs.name
  virtual_network_name  = dependency.vnet.outputs.name
  prefix                = "${include.root.inputs.project_name}-${include.root.inputs.environment}"
  name                  = "app-services"
  address_prefixes      = ["10.0.2.0/24"]
  service_endpoints     = ["Microsoft.Web"]
}

prevent_destroy = true
