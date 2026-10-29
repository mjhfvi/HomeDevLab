terraform {
  source = "../../../../modules/resource-group"
}

include "root" {
  path   = find_in_parent_folders("root.hcl")
  expose = true
}

inputs = {
  name = include.root.inputs.prefix_long
}

prevent_destroy = true
