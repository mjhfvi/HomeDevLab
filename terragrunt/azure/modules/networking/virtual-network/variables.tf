variable "name" {}
variable "resource_group_name" {
    description = "Resource group name"
}
variable "location" {
    description = "Location"
}
variable "address_space" {
    type = list(string)
    default = ["10.0.0.0/16"]
}
variable "tags" {
  type = map
}