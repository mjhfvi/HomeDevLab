resource "azurerm_nat_gateway" "gateway" {
  name                    = lower("${var.prefix}-nat-gateway")
  location                = var.location
  resource_group_name     = var.resource_group_name
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10
  tags                    = var.tags
}