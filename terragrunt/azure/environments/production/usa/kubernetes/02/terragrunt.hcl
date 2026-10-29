include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

terraform{
  source = "../../../../../modules/kubernetes"
}

dependency "resource_group" {
  config_path = "../../resource-group"
}

dependency "subnet" {
  config_path = "../../networking/subnet/k8s-subnet"
}

inputs = {
  resource_group_name = dependency.resource_group.outputs.name
  subnet_id           = dependency.subnet.outputs.id
  name                = "02"
  cidr                = "10.0.11.0/24"
  dns_service_ip      = "10.0.11.254"
}

prevent_destroy = true
