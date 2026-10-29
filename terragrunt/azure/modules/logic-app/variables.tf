variable "prefix" {
  type = string
  nullable = false
}
variable "name" {
  type = string
  nullable = false
}
variable "location" {
  type = string
  nullable = false
}
variable "resource_group_name" {
  type = string
  nullable = false
}
variable "tags" {
  type = map
}