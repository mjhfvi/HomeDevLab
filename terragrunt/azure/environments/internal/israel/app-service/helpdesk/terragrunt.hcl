include "root" {
  path    = find_in_parent_folders("root.hcl")
  expose  = true
}

terraform{
  source = "../../../../../modules/app-service//linux"
}

dependency "resource_group" {
  config_path = "../../resource-group"
}

dependency "service_plan" {
  config_path = "../../app-service-plan"
}

dependency "subnet" {
  config_path = "../../networking/subnet/apps-subnet"
}

inputs = {
  resource_group_name                           = dependency.resource_group.outputs.name
  service_plan_id                               = dependency.service_plan.outputs.id
  virtual_network_subnet_id                     = dependency.subnet.outputs.id
  container_registry_managed_identity_client_id = "ce09694a-270d-4171-9a19-3934ea493897"
  name                                          = "helpdesk"
  slots                                         = []
  application_insight                           = false
  premium_resource                              = false
}

prevent_destroy = false
