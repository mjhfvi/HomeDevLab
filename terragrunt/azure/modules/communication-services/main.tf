resource "azurerm_communication_service" "service" {
  name                = var.name
  resource_group_name = var.resource_group_name
  data_location       = "United States"
  tags                = var.tags
}