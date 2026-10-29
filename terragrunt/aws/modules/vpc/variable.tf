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

variable "vpc_name" {
    description = "VPC Name"
    type        = string
    sensitive   = false
    nullable    = false
    default     = ""

    # validation {
    #     condition     = length(var.vpc_name) > 0
    #     error_message = "Validation: 'vpc_name' Must be Provided and Not be Empty"
    # }
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

variable "private_subnet_a" {
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

variable "private_subnet_b" {
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

variable "public_subnet_a" {
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

variable "public_subnet_b" {
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

variable "db_subnet_a" {
    description = "Database Subnets A"
    type        = string
    sensitive   = false
    nullable    = false
    default     = "10.0.21.0/24"

    # validation {
    #     condition     = length(var.db_subnet_a) > 0
    #     error_message = "Validation: 'db_subnet_a' Must be Provided and Not be Empty"
    # }
}

variable "db_subnet_b" {
    description = "Database Subnets B"
    type        = string
    sensitive   = false
    nullable    = false
    default     = "10.0.22.0/24"


    # validation {
    #     condition     = length(var.db_subnet_b) > 0
    #     error_message = "Validation: 'db_subnet_b' Must be Provided and Not be Empty"
    # }
}
