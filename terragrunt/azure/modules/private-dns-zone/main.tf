locals { 
  name = "privatelink.${var.name}"
}
resource "azurerm_private_dns_zone" "privatelink" {
  name                = local.name
  resource_group_name = var.resource_group_name
  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "link" {
  name                  = random_string.random.result
  private_dns_zone_name = azurerm_private_dns_zone.privatelink.name
  virtual_network_id    = var.virtual_network_id
  resource_group_name   = var.resource_group_name
  tags = var.tags

  lifecycle {
    ignore_changes = [name]
  }
}

resource "random_string" "random" {
  length           = 13
  upper            = false
  lower            = true
  numeric          = true
  min_numeric      = 2
  special          = false
}