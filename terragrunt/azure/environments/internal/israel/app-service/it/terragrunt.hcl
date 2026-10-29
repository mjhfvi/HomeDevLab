include "root" {
  path    = find_in_parent_folders("root.hcl")
  expose  = true
}

terraform{
  source = "../../../../../modules/app-service//windows"
}

dependency "resource_group" {
  config_path = "../../resource-group"
}

dependency "service_plan" {
  config_path = "../../app-service-plan"
}

inputs = {
  resource_group_name       = dependency.resource_group.outputs.name
  service_plan_id           = dependency.service_plan.outputs.id
  name                      = "it"
  slots                     = []
  application_insight       = false
  premium_resource          = false
}

prevent_destroy = false
