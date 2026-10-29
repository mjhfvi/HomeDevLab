resource "azurerm_subnet" "my_terraform_subnet" {
  name                 = var.override_resource_name ? var.name : lower("${var.prefix}-${var.name}-subnet")
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes

  service_endpoints = var.service_endpoints

  lifecycle {
    ignore_changes = [ 
      delegation
     ]
  }
}

resource "azurerm_subnet_nat_gateway_association" "nat" {
  count = var.nat_gateway_id != null ? 1 : 0
  subnet_id      = azurerm_subnet.my_terraform_subnet.id
  nat_gateway_id = var.nat_gateway_id
}