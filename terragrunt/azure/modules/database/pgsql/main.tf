locals{
  name = lower("${var.prefix}-pgsql-${var.name}")
  username = "pgsqladmin"
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

# resource "azurerm_private_dns_zone" "pgsql" {
#   name                = "${local.name}.postgres.database.azure.com"
#   resource_group_name = var.resource_group_name
# }

# resource "azurerm_private_dns_zone_virtual_network_link" "private" {
#   name                  = "privatelink.postgres.database.azure.com"
#   private_dns_zone_name = azurerm_private_dns_zone.pgsql.name
#   virtual_network_id    = var.virtual_network_id
#   resource_group_name   = var.resource_group_name
# }

resource "azurerm_postgresql_flexible_server" "server" {
  name                          = local.name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = "16"
  #delegated_subnet_id           = var.virtual_network_subnet_id
  #private_dns_zone_id           = azurerm_private_dns_zone.pgsql.id
  public_network_access_enabled = true
  administrator_login           = local.username
  administrator_password        = random_password.password.result

  storage_mb   = 32768
  storage_tier = "P6"

  sku_name   = "B_Standard_B1ms" //"GP_Standard_D2ds_v5"
  #depends_on = [azurerm_private_dns_zone_virtual_network_link.private]
}

resource "random_password" "password" {
  length      = 15
  min_lower   = 1
  min_upper   = 1
  min_numeric = 1
  min_special = 1
  special     = true

  keepers = {
    name = local.name
  }

}