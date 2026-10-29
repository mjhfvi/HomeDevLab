resource "azurerm_service_plan" "service_plan" {
  name                = lower("${var.prefix}-service-plan-${var.name}")
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type = var.os_type
  sku_name = var.sku_name
  per_site_scaling_enabled = true

  tags = var.tags
}