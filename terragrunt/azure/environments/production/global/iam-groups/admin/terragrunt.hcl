terraform{
  source = "../../../../../modules/entra-id/group"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

inputs = {
  name = "Azure Global Admin"
}

prevent_destroy = true
