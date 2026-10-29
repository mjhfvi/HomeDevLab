# Source: https://github.com/terraform-aws-modules/terraform-aws-security-group/blob/master/examples/complete/main.tf

module "security-group" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "5.3.0"

    name        = "open-from-office"
    description = "Security Group to Allow Access from Office with custom ports"
    vpc_id      = var.vpc_id # set to terragrunt.hcl

    # ingress_cidr_blocks      = ["10.0.0.0/16"]
    # ingress_rules            = ["https-443-tcp"]
    ingress_with_cidr_blocks = [
        {
            from_port   = 22
            to_port     = 22
            protocol    = "tcp"
            description = "SSH Ports"
            cidr_blocks = var.private_subnets # set to terragrunt.hcl
        }
    ]

  tags = {
    Resources = "terraform-aws-modules/security-group/aws"
  }
}