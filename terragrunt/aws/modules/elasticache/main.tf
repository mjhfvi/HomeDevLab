
module "elasticache" {
  source = "terraform-aws-modules/elasticache/aws"

  replication_group_id = "octopus-dev-redis-videochat"

  engine         = "valkey"
  engine_version = "7.2"
  node_type      = "cache.t4g.small" # https://aws.amazon.com/elasticache/pricing/

  transit_encryption_enabled = true
  auth_token                 = "PickSomethingMoreSecure123!"
  maintenance_window         = "sun:05:00-sun:09:00"
  apply_immediately          = true

  # Security Group
  vpc_id = module.vpc.vpc_id
  security_group_rules = {
    ingress_vpc = {
      # Default type is `ingress`
      # Default port is based on the default engine port
      description = "VPC traffic"
      cidr_ipv4   = module.vpc.cidr_default
    }
  }

  # Subnet Group
  subnet_group_name        = "elasticache-subnet-group"
  subnet_group_description = "Elasticache subnet group"
  subnet_ids               = module.vpc.private_subnet_a

  # Parameter Group
  create_parameter_group      = true
  parameter_group_name        = "elasticache-parameter-group"
  parameter_group_family      = "valkey7"
  parameter_group_description = "Elasticache parameter group"
  parameters = [
    {
      name  = "latency-tracking"
      value = "yes"
    }
  ]

  tags = {
    Resource = "terraform-aws-modules/elasticache/aws"
  }
}
