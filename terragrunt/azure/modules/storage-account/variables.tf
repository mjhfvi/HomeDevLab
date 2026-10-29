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

variable "account_tier" {
    type = string
    default = "Standard"

    validation {
        condition     = contains(["Standard", "Premium"], var.account_tier)
        error_message = "Allowed values for account_tier are \"Standard\", or \"Premium\"."
  }
}

variable "account_replication_type" {
    type = string
    default = "GRS"

    validation {
        condition     = contains(["GRS", "LRS"], var.account_replication_type)
        error_message = "Allowed values for account_replication_type are \"GRS\", or \"LRS\"."
  }
}

