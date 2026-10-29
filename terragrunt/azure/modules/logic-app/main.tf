resource "azurerm_logic_app_workflow" "app" {
  name                = lower("${var.prefix}-logic-app-${var.name}")
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}