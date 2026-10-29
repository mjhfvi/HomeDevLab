variable "name" {}
variable "prefix" {}
variable "resource_group_name" {
    description = "Resource group name"
}
variable "location" {
    description = "Location"
}
variable "tags" {
  type = map
}