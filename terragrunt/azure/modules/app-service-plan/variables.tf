variable "prefix" {}
variable "name" {}
variable "location" {}
variable "resource_group_name"{}
variable "sku_name"{}
variable "os_type"{
    default = "Windows"

    validation {
        condition     = contains(["Windows", "Linux", "WindowsContainer"], var.os_type)
        error_message = "Allowed values for os_type are \"Windows\", \"Linux\", or \"WindowsContainer\"."
    }
}

variable "tags" {
  type = map
}
