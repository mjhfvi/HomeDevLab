variable "name" {}
variable "sku_name" {}
variable "server_id" {}
variable "max_size_gb" {}
variable "storage_account_type" {
  type = string
  default = "Geo"
}
variable "tags" {
  type = map
}