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
variable "service_plan_id" {
  type = string
  nullable = false
}
variable "tags" {
  type = map
}

variable "application_insight" {
  type = bool
  default = true
}
variable "virtual_network_subnet_id" {}