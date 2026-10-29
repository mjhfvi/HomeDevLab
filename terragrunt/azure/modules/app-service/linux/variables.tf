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
variable "slots" {
  type    = set(string)
  default = []
  sensitive = false
  
}
variable "application_insight" {
  type = bool
  default = true
}

variable "websockets_enabled" {
  type = bool
  default = false
}

variable "premium_resource" {
  type = bool
  default = true
}

variable "virtual_network_subnet_id" {
  nullable = true
  default = null
}
variable "office_ip_address" {
  description = "IP address for office access"
  type        = string
  default     = ""
}
variable "always_on" {
  type = bool
  default = true
}
variable "container_registry_managed_identity_client_id" {
  type = string
  nullable = true
}