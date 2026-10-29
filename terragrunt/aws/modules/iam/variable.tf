variable "environment_name" {
    description = "environment name"
    type        = string
    sensitive   = false
    nullable    = false
    default     = "Testing"

    validation {
        condition     = length(var.environment_name) > 0
        error_message = "environment_name Must be Provided and Not be Empty"
    }
}

variable "account_id" {
    description = "AWS account ID"
    type        = string
    sensitive   = false
    nullable    = false
    default     = "316115107540"

    validation {
        condition     = length(var.account_id) > 0
        error_message = "account_id Must be Provided and Not be Empty"
    }
}

variable "aws_region" {
    description = "aws region"
    type        = string
    sensitive   = false
    nullable    = false
    default     = "us-east-1"

    validation {
        condition     = length(var.aws_region) > 0
        error_message = "aws_region Must be Provided and Not be Empty"
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
    description = "cidr default"
    type        = string
    sensitive   = false
    nullable    = false
    default     = "10.0.0.0/16"

    validation {
        condition     = length(var.cidr_default) > 0
        error_message = "Validation: cidr_default Must be Provided and Not be Empty"
    }
}

variable "private_subnets" {
    description = "private subnets"
    type        = string
    sensitive   = false
    nullable    = false
    default     = "10.0.1.0/24"

    validation {
        condition     = length(var.private_subnets) > 0
        error_message = "Validation: private_subnets Must be Provided and Not be Empty"
    }
}

variable "vpc_subnet_private_ids" {
    description = "Validation: Placeholder for 'subnet_private_id' Value"
    type        = string
    sensitive   = false
    nullable    = false
    default     = ""
}

variable "iam_user_name" {
    description = "Validation: Placeholder for 'iam_user' Value"
    type        = string
    sensitive   = false
    nullable    = false
    default     = ""
}

variable "iam_group_name" {
    description = "Validation: Placeholder for 'iam_group' Value"
    type        = string
    sensitive   = false
    nullable    = false
    default     = ""
}

variable "name" {
    description = "Validation: Placeholder for 'name' Value"
    type        = string
    sensitive   = false
    nullable    = false
    default     = ""
}

variable "oidc_provider" {
    description = "Validation: Placeholder for 'oidc_provider' Value"
    type        = string
    sensitive   = false
    nullable    = false
    default     = ""
}

variable "oidc_provider_arn" {
    description = "Validation: Placeholder for 'oidc_provider_arn' Value"
    type        = string
    sensitive   = false
    nullable    = false
    default     = ""
}

variable "oidc_provider_url" {
    description = "Validation: Placeholder for 'oidc_provider_url' Value"
    type        = string
    sensitive   = false
    nullable    = false
    default     = ""
}