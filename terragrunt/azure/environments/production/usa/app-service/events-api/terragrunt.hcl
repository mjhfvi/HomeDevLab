include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

terraform{
  source = "../../../../../modules/app-service//windows/"
}

dependency "resource_group" {
  config_path = "../../resource-group"
}

dependency "service_plan" {
  config_path = "../../app-service-plan/02"
}

dependency "subnet" {
  config_path = "../../networking/subnet/apps-subnet"
}

dependency "log_analytics_workspace" {
  config_path = "../../log-analytics-workspace"
}

inputs = {
  resource_group_name       = dependency.resource_group.outputs.name
  service_plan_id           = dependency.service_plan.outputs.id
  virtual_network_subnet_id = dependency.subnet.outputs.id
  workspace_id              = dependency.log_analytics_workspace.outputs.id
  name                      = "events-api"
  slots                     = []
}

prevent_destroy = true
