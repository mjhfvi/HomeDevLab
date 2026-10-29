variable "name" {}
variable "resource_group_name" {
    description = "Resource group name"
}
variable "location" {
    description = "Location"
}
variable "subnet_id" {}
variable "address_space" {
    type = list(string)
}
variable "tags" {
  type = map
}