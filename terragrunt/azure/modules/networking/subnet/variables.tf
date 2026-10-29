variable "prefix" {
    
}
variable "name" {
    
}
variable "override_resource_name" {
    type = bool
    default = false
}
variable "resource_group_name" {
    description = "Resource group name"
}
variable "virtual_network_name"{}
variable "nat_gateway_id" {
    type = string
    nullable = true
    default = null
}
variable "address_prefixes" {
    type    = list(string)
    default = ["10.0.1.0/24"]
}

variable "service_endpoints" {
    type    = set(string)
    default = null
}