resource "azurerm_public_ip_prefix" "public_ip_prefix" {
  name                = "${var.prefix}-public-ip-prefix-${var.name}"
  location            = var.location
  resource_group_name = var.resource_group_name

  prefix_length = 28
}