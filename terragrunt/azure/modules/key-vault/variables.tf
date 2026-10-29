variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "tenant_id" {}
variable "enable_rbac_authorization" {
    type = bool
    default = true
}