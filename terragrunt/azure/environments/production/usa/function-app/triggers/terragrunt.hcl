include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

terraform{
  source = "../../../../../modules/function-app"
}

dependency "resource_group" {
  config_path = "../../resource-group"
}

dependency "service_plan" {
  config_path = "../../app-service-plan/01"
}

dependency "subnet" {
  config_path = "../../networking/subnet/apps-subnet"
}

inputs = {
  resource_group_name = dependency.resource_group.outputs.name
  service_plan_id           = dependency.service_plan.outputs.id
  virtual_network_subnet_id = dependency.subnet.outputs.id
  name="triggers"
}

prevent_destroy = true
