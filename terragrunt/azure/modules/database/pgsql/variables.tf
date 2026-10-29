variable "name" {}
variable "prefix" {}

variable "tags" {
  type = map
}
variable "location" {}
variable "resource_group_name" {}
variable "key_vault_id" {}
variable "virtual_network_id" {}
variable "virtual_network_subnet_id" {}
variable "assigned_identity" {}