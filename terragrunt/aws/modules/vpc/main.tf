# Source: https://github.com/terraform-aws-modules/terraform-aws-vpc

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  name = var.environment_name # set to terragrunt.hcl
  cidr = var.cidr_default     # set to terragrunt.hcl

  azs             = ["${var.aws_region}a", "${var.aws_region}b"]              # set to terragrunt.hcl
  public_subnets  = ["${var.public_subnet_a}", "${var.public_subnet_b}"]      # set to terragrunt.hcl
  private_subnets = ["${var.private_subnet_a}", "${var.private_subnet_b}"]    # set to terragrunt.hcl
  database_subnets = ["${var.db_subnet_a}", "${var.db_subnet_b}"]

  create_database_subnet_group           = true
  create_database_subnet_route_table     = true
  create_database_internet_gateway_route = false
  database_subnet_group_name = "default-database-subnet-group"

  # NAT Gateways: Blocks inbound internet access, Allow outbound access to the internet
  enable_nat_gateway   = true # Use for Internet access
  single_nat_gateway   = true # Use for Internet access
  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_dhcp_options  = true

  # route {
  #     cidr_block = "0.0.0.0/0"
  #     gateway_id = aws_internet_gateway.main.id
  # }

  tags = {
      Resource = "terraform-aws-modules/vpc/aws"
  }
}