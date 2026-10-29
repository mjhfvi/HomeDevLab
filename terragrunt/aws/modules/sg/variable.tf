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

variable "private_subnets" {
    description = "Private Subnets"
    type        = string
    sensitive   = false
    nullable    = false
    default     = "10.0.1.0/24"

    validation {
        condition     = length(var.private_subnets) > 0
        error_message = "Validation: 'private_subnets' Must be Provided and Not be Empty"
    }
}
