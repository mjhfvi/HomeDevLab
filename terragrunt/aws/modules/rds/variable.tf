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

variable "rds_name" {
    description = "RDS Instance Name"
    type        = string
    sensitive   = false
    nullable    = false
    default     = "default-rds-instance"

    validation {
        condition     = length(var.rds_name) > 0
        error_message = "Validation: 'rds_name' Must be Provided and Not be Empty"
    }
}

variable "database_subnet_group_name" {
    description = "Database Subnet Group Name"
    type        = string
    sensitive   = false
    nullable    = false
    default     = "default-database-subnet-group"

    validation {
        condition     = length(var.database_subnet_group_name) > 0
        error_message = "Validation: 'database_subnet_group_name' Must be Provided and Not be Empty"
    }
}

variable "vpc_default_security_group_ids" {
    description = "VPC Default Security Group IDs"
    type        = list(string)
    sensitive   = false
    nullable    = false
    default     = ["default-security-group-id"]

    # validation {
    #     condition     = length(var.vpc_default_security_group_ids) > 0
    #     error_message = "Validation: 'vpc_default_security_group_ids' Must be Provided and Not be Empty"
    # }
}

variable "instance_class" {
    description = "RDS Instance Class"
    type        = string
    sensitive   = false
    nullable    = false
    default     = "db.t4g.large"

    validation {
        condition     = startswith(var.instance_class, "db.t4g")
        error_message = "Validation: 'instance_class' must start with 'db.t4g'"
    }
}

variable "db_name" {
    description = "RDS Database Name"
    type        = string
    sensitive   = false
    nullable    = false
    default     = "completePostgresql"

    validation {
        condition     = length(var.db_name) >= 8
        error_message = "Validation: 'db_name' Must be Provided and Not be Under 8 Characters"
    }
}

variable "username" {
    description = "RDS Master Username"
    type        = string
    sensitive   = false
    nullable    = false
    default     = "complete_postgresql"

    validation {
        condition     = length(var.username) > 0
        error_message = "Validation: 'username' Must be Provided and Not be Empty"
    }
}

variable "allocated_storage" {
    description = "RDS Allocated Storage (GB)"
    type        = number
    sensitive   = false
    nullable    = false
    default     = 20

    validation {
        condition     = var.allocated_storage >= 20 && var.allocated_storage <= 80
        error_message = "Validation: 'allocated_storage' Must be Between 20 and 80 GB"
    }
}

variable "create_db_instance" {
    description = "Whether to Create the RDS DB Instance"
    type        = bool
    sensitive   = false
    nullable    = false
    default     = false

    validation {
        condition     = var.create_db_instance == true || var.create_db_instance == false
        error_message = "Validation: 'create_db_instance' Must be a Boolean Value"
    }
}