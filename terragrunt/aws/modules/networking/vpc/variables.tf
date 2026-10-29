variable "instance_name" {}
variable "cidr_block" {
    description = "The CIDR block for the VPC"
    type = string
    default = "10.100.0.0/16"
}