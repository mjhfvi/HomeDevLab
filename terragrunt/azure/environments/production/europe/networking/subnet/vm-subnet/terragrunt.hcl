terraform{
  source = "../../../../../../modules/networking/subnet"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

inputs = {
   name = "virtual-machines"
   virtual_network_name = "octopus-production-vnet"
}

prevent_destroy = true
