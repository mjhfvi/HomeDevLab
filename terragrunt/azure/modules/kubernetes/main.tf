resource "azurerm_kubernetes_cluster" "k8s" {
  name                = "${var.prefix}-${var.name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix = random_string.random.lower
  automatic_channel_upgrade  = "patch"

  network_profile {
    network_plugin = "azure"
    service_cidr = var.cidr
    dns_service_ip = var.dns_service_ip
  }

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = var.node_size
    vnet_subnet_id = var.subnet_id
    tags = var.tags
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [
      default_node_pool[0].upgrade_settings
    ]
  }
}

resource "random_string" "random" {
  length    = 5
  special   = false
  numeric   = false
  keepers = {
    prefix = var.prefix,
    name = var.name
  }
}