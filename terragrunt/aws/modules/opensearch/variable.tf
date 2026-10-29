variable "account_id" {
  description = "AWS account ID"
  type        = string
  sensitive   = false
  nullable    = false
  default     = ""

}

variable "office_ip_address" {
  description = "Office IP Address"
  type        = string
  sensitive   = false
  nullable    = false
  default     = ""

}

variable "environment_name" {
  description = "Environment Name"
  type        = string
  sensitive   = false
  nullable    = false
  default     = "Testing"

  validation {
    condition     = length(var.environment_name) > 0
    error_message = "Validation: 'environment_name' Must be Provided and Not be Empty"
  }
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  sensitive   = false
  nullable    = false
  default     = "us-east-1"

  validation {
    condition     = length(var.aws_region) > 0
    error_message = "Validation: 'aws_region' Must be Provided and Not be Empty"
  }
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
  sensitive   = false
  nullable    = false
  default     = ""
}

variable "cidr_default" {
  description = "CIDR Default"
  type        = string
  sensitive   = false
  nullable    = false
  default     = "10.0.0.0/16"

  validation {
    condition     = length(var.cidr_default) > 0
    error_message = "Validation: 'cidr_default' Must be Provided and Not be Empty"
  }
}

variable "vpc_subnet_private_id_a" {
  description = "Private Subnets A"
  type        = string
  sensitive   = false
  nullable    = false
  default     = "10.0.1.0/24"

  #     validation {
  #         condition     = length(var.private_subnets) > 0
  #         error_message = "Validation: 'private_subnets' Must be Provided and Not be Empty"
  #     }
}

variable "vpc_subnet_private_id_b" {
  description = "Private Subnets B"
  type        = string
  sensitive   = false
  nullable    = false
  default     = "10.0.2.0/24"

  # validation {
  #     condition     = length(var.private_subnets) > 0
  #     error_message = "Validation: 'private_subnets' Must be Provided and Not be Empty"
  # }
}

variable "vpc_subnet_public_id_a" {
  description = "Public Subnets A"
  type        = string
  sensitive   = false
  nullable    = false
  default     = "10.0.3.0/24"

  # validation {
  #     condition     = length(var.public_subnets_a) > 0
  #     error_message = "Validation: 'public_subnets_a' Must be Provided and Not be Empty"
  # }
}

variable "vpc_subnet_public_id_b" {
  description = "Public Subnets B"
  type        = string
  sensitive   = false
  nullable    = false
  default     = "10.0.4.0/24"

  # validation {
  #     condition     = length(var.public_subnets_b) > 0
  #     error_message = "Validation: 'public_subnets_b' Must be Provided and Not be Empty"
  # }
}

variable "domain_name" {
  description = "domain name"
  type        = string
  sensitive   = false
  nullable    = false
  default     = ""
}

variable "engine_version" {
  description = "engine version"
  type        = string
  sensitive   = false
  nullable    = false
  default     = ""
}

variable "master_user_name" {
  description = "master user name"
  type        = string
  sensitive   = false
  nullable    = false
  default     = "user"

  validation {
    condition     = length(var.master_user_name) > 0
    error_message = "Validation: 'master_user_name' Must be Provided and Not be Empty"
  }
}

variable "master_user_password" {
  description = "master user password"
  type        = string
  sensitive   = false
  nullable    = false
  default     = "Octopus!"

  validation {
    condition     = length(var.master_user_password) > 0
    error_message = "Validation: 'master_user_password' Must be Provided and Not be Empty"
  }
}

variable "instance_count" {
  description = "instance count"
  type        = string
  sensitive   = false
  nullable    = false
  default     = ""
}

variable "dedicated_master_type" {
  description = "dedicated master type"
  type        = string
  sensitive   = false
  nullable    = false
  default     = ""
}

variable "instance_type" {
  description = "instance type"
  type        = string
  sensitive   = false
  nullable    = false
  default     = ""
}

variable "ebs_options_volume_size" {
  description = "instance type"
  type        = string
  sensitive   = false
  nullable    = false
  default     = "50"
}
