locals{
  name = lower("${var.prefix}-mssql-${var.name}")
  username = "azuremssqladmin"
}

resource "azurerm_mssql_server" "server" {
  name                         = local.name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = local.username
  administrator_login_password = random_password.password.result
  
  azuread_administrator {
    azuread_authentication_only = var.azuread_authentication_only
    login_username = "SQL Admin"
    object_id      = "11876bb5-21ea-418a-b74e-953af0a9b9c5"
  }

  tags = var.tags
}

resource "azurerm_key_vault_secret" "username" {
  name         ="${local.name}-username"
  value        = local.username
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "password" {
  name         ="${local.name}-password"
  value        = random_password.password.result
  key_vault_id = var.key_vault_id
}

resource "random_password" "password" {
  length      = 20
  min_lower   = 1
  min_upper   = 1
  min_numeric = 1
  min_special = 1
  special     = true

  keepers = {
    name = local.name
  }

}