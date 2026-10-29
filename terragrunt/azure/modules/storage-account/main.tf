resource "azurerm_storage_account" "storage" {
  name                      = var.name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  shared_access_key_enabled = false
  
  min_tls_version           = "TLS1_2"

  tags = var.tags
}
