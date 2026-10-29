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

variable "account_id" {
  description = "aws account ID"
  type        = string
  sensitive   = false
  nullable    = false
  default     = "110977281067"

  validation {
    condition     = length(var.account_id) > 0
    error_message = "account_id Must be Provided and Not be Empty"
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

variable "private_subnet" {
  description = "private subnets"
  type        = string
  sensitive   = false
  nullable    = false
  default     = "10.0.1.0/24"

  validation {
    condition     = length(var.private_subnet) > 0
    error_message = "Validation: private subnet Must be Provided and Not be Empty"
  }
}

variable "public_subnet" {
  description = "public subnets"
  type        = string
  sensitive   = false
  nullable    = false
  default     = "10.0.1.0/24"

  validation {
    condition     = length(var.public_subnet) > 0
    error_message = "Validation: public subnet Must be Provided and Not be Empty"
  }
}

variable "vpc_subnet_private_id_a" {
  description = "Validation: Placeholder for 'vpc_subnet_private_a_ids' Value"
  type        = string
  sensitive   = false
  nullable    = false
  default     = ""
}

variable "vpc_subnet_private_id_b" {
  description = "Validation: Placeholder for 'vpc_subnet_private_b_ids' Value"
  type        = string
  sensitive   = false
  nullable    = false
  default     = ""
}

variable "vpc_subnet_public_id_a" {
  description = "Validation: Placeholder for 'vpc_subnet_public_a_ids' Value"
  type        = string
  sensitive   = false
  nullable    = false
  default     = ""
}

variable "vpc_subnet_public_id_b" {
  description = "Validation: Placeholder for 'vpc_subnet_public_b_ids' Value"
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

variable "kubernetes_version" {
  description = "Validation: Placeholder for 'kubernetes_version' Value"
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

variable "create_general_purpose" {
  description = "Flag to determine whether to create the general-purpose node group"
  type        = bool
  sensitive   = false
  nullable    = false
  default     = true
}

variable "create_gpu_purpose" {
  description = "Flag to determine whether to create the gpu-purpose node group"
  type        = bool
  sensitive   = false
  nullable    = false
  default     = false
}

variable "create_general_purpose_arm" {
  description = "Flag to determine whether to create the general-purpose ARM node group"
  type        = bool
  sensitive   = false
  nullable    = false
  default     = false

}
variable "deletion_protection" {
  description = "Flag to determine whether to enable deletion protection for the EKS cluster"
  type        = bool
  sensitive   = false
  nullable    = false
  default     = false

}

variable "endpoint_public_access" {
  description = "Flag to determine whether to enable public access for the EKS cluster endpoint"
  type        = bool
  sensitive   = false
  nullable    = false
  default     = false

  validation {
      condition     = var.endpoint_public_access == true || var.endpoint_public_access == false
      error_message = "Validation: 'endpoint_public_access' Must be a Boolean Value (true or false)"
  }
}

variable "credentials_file_path" {
  description = "Path to the AWS credentials file"
  type        = string
  sensitive   = false
  nullable    = false
  default     = ""

  # validation {
  #     condition     = length(var.credentials_file_path) > 0
  #     error_message = "Validation: 'credentials_file_path' Must be Provided and Not be Empty"
  # }
}
