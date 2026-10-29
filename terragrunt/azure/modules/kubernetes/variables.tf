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

variable "node_size" {
  type = string
  default = "Standard_D4ps_v5"  
}
variable "subnet_id" {}
variable "cidr" {}
variable "dns_service_ip" {}