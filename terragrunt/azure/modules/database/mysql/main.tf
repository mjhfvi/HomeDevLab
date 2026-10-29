locals{
  name = lower("${var.prefix}-mysql-${var.name}")
  username = "mysqladmin"
}

resource "azurerm_mysql_flexible_server" "server" {
  name                          = local.name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  administrator_login           = local.username
  administrator_password        = random_password.password.result
  backup_retention_days         = 7
  replication_role              = "None"
  sku_name                      = "B_Standard_B1ms"
  version                       = "8.0.21"

  identity {
      type = "UserAssigned"
      identity_ids = var.assigned_identity
  }

  tags = var.tags
}

resource "azurerm_mysql_flexible_database" "database" {
  for_each                    = var.databases
  name                        = lower(each.value)
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
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