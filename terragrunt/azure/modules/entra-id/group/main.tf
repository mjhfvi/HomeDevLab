resource "azuread_group" "group" {
  display_name = var.name
  security_enabled = true
  mail_enabled = false
}