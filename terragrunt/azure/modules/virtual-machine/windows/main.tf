locals {
  name = lower("${var.prefix}-vm-${var.name}")
  short_name = upper("${var.prefix_short}-${var.name}")
  username = "azureuser"
}
# Create public IPs
resource "azurerm_public_ip" "my_terraform_public_ip" {
  name                = "${local.name}-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  public_ip_prefix_id = var.public_ip_prefix_id
  domain_name_label   = local.name
  sku                 = "Standard"

  tags = var.tags
}

# Create Network Security Group and rules
resource "azurerm_network_security_group" "my_terraform_nsg" {
  name                = "${local.name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "RDP"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "199.203.222.225/32"
    destination_address_prefix = "*"
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [
      security_rule
    ]
  }
}

# Create network interface
resource "azurerm_network_interface" "my_terraform_nic" {
  name                = "${local.name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "vm_nic_configuration"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.my_terraform_public_ip.id
  }

  tags = var.tags
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.my_terraform_nic.id
  network_security_group_id = azurerm_network_security_group.my_terraform_nsg.id
}

# Create virtual machine
resource "azurerm_windows_virtual_machine" "main" {
  name                  = local.name
  computer_name         = local.short_name
  admin_username        = local.username
  admin_password        = random_password.password.result
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.my_terraform_nic.id]
  size                  = var.size

  identity {
    type = "SystemAssigned"
  }

  
  os_disk {
    name                 = "${local.name}-os-disk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }

  tags = var.tags
}

# Install IIS web server to the virtual machine
resource "azurerm_virtual_machine_extension" "web_server_install" {
  count                      = var.install_iis ? 1 : 0 
  name                       = "IIS"
  virtual_machine_id         = azurerm_windows_virtual_machine.main.id
  publisher                  = "Microsoft.Compute"
  type                       = "CustomScriptExtension"
  type_handler_version       = "1.8"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
    {
      "commandToExecute": "powershell -ExecutionPolicy Unrestricted Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools"
    }
  SETTINGS
}

resource "azurerm_virtual_machine_extension" "aad_login" {
  name                 = "AADLogin"
  virtual_machine_id   = azurerm_windows_virtual_machine.main.id
  publisher            = "Microsoft.Azure.ActiveDirectory"
  type                 = "AADLoginForWindows"
  type_handler_version = "1.0"
  auto_upgrade_minor_version = true
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

resource "random_password" "password" {
  length      = 20
  min_lower   = 1
  min_upper   = 1
  min_numeric = 1
  min_special = 1
  special     = true

  keepers = {
    name = local.name
  }

}