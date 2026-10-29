include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

terraform{
  source = "../../../../../modules/networking/vpn-network-gateway"
}

dependency "resource_group" {
  config_path = "../../resource-group"
}

dependency "subnet" {
  config_path = "../../networking/subnet/gateway-subnet"
}

inputs = {
  resource_group_name = dependency.resource_group.outputs.name
  subnet_id           = dependency.subnet.outputs.id
  name                = "${include.root.inputs.prefix_long}-b60c177f3ea6"
  address_space       = ["172.16.2.0/25"]
}

prevent_destroy = true
