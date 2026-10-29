variable "name" {}

variable "tags" {
  type = map
}
variable "location" {}
variable "resource_group_name" {}
variable "subnet_id" {}
variable "size" {}
variable "prefix" {
  type        = string
  description = "Prefix of the resource name"
}

variable "prefix_short" {}

variable "key_vault_id" {}

variable "public_ip_prefix_id" {
  nullable = true
  default = null
}

variable "install_iis" {
  type = bool
  default = false
}