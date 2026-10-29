include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

terraform{
  source = "../../../../../modules/database/mssql//database/"
}

dependency "sql_server" {
  config_path = "../server"
}


inputs = {
  server_id   = dependency.sql_server.outputs.id
  name        = "octopus"
  max_size_gb = 2
  sku_name    = "Basic"
  storage_account_type = "Local"
}

prevent_destroy = true
