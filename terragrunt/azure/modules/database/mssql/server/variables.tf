variable "name" {}
variable "prefix" {}

variable "tags" {
  type = map
}
variable "location" {}
variable "resource_group_name" {}
variable "key_vault_id" {}
variable "azuread_authentication_only" {
  type = bool
  default = true
}