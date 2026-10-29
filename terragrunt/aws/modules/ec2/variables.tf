variable "prefix" {}
variable "instance_name" {
  description = "The name to give the instance"
  type        = string
}
variable "vpc_id" {
    type = string
}
variable "subnet_id" {
    type = string
}
variable "instance_type" {
    description = "The type of instance to start"
    type        = string
}

 variable "use_ebs_root" {
    type    = bool
    default = true
}

variable "root_volume_size" {
  description = "The size of the root volume in gigabytes"
  type        = number
  default     = 512
}

variable "ebs_volume_type" {
  description = "The type of EBS volume"
  type        = string
  default     = "gp3"
}



