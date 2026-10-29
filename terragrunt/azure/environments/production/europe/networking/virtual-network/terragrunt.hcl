terraform{
  source = "../../../../../modules/networking/virtual-network"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

inputs = {
   name=include.root.inputs.prefix_long
   address_space = ["10.1.0.0/16"]
}

prevent_destroy = true
