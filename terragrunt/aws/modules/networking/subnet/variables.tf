variable "prefix" {}
variable "instance_name" {}
variable "cidr_block" {
    description = "The CIDR block for the subnet"
    type = string
    default = "10.100.1.0/24"
}
variable "vpc_id" {
    type = string
}

variable "route_table_id" {
    type = string
}
