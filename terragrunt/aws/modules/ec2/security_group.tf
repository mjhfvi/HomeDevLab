resource "aws_security_group" "main" {
  description = "Managed by Terraform"
  name        = "corsight-sg"
  region      = "us-east-1"
  vpc_id      = "vpc-02af5cba7de3420e7"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  ingress {
    cidr_blocks = ["103.21.244.0/22", "103.22.200.0/22", "103.31.4.0/22", "104.16.0.0/13", "104.24.0.0/14", "108.162.192.0/18", "131.0.72.0/22", "141.101.64.0/18", "162.158.0.0/15", "172.64.0.0/13", "173.245.48.0/20", "188.114.96.0/20", "190.93.240.0/20", "197.234.240.0/22", "198.41.128.0/17"]
    description = "CLOUDFLARE"
    from_port   = "443"
    protocol    = "tcp"
    self        = "false"
    to_port     = "443"
  }

  ingress {
    cidr_blocks = ["172.183.214.64/32"]
    description = "Azure"
    from_port   = "0"
    protocol    = "tcp"
    self        = "false"
    to_port     = "65535"
  }

  ingress {
    cidr_blocks = ["199.203.222.225/32"]
    from_port   = "0"
    protocol    = "tcp"
    self        = "false"
    to_port     = "65535"
  }

  ingress {
    description      = "CLOUDFLARE IPV6"
    from_port        = "443"
    ipv6_cidr_blocks = ["2400:cb00::/32", "2405:8100::/32", "2405:b500::/32", "2606:4700::/32", "2803:f800::/32", "2a06:98c0::/29", "2c0f:f248::/32"]
    protocol         = "tcp"
    self             = "false"
    to_port          = "443"
  }

  tags = {
    Name = "octopus-prod-us-corsight-sg"
  }

  tags_all = {
    Name = "octopus-prod-us-corsight-sg"
  }

}

resource "aws_security_group" "default" {
  description = "default VPC security group"
  name   = "default"
  region = "us-east-1"
  vpc_id = "vpc-02af5cba7de3420e7"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["10.0.20.0/24"]
    from_port   = "0"
    protocol    = "-1"
    self        = "true"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["192.115.119.162/32", "199.203.222.225/32"]
    from_port   = "0"
    protocol    = "tcp"
    self        = "false"
    to_port     = "65535"
  }


}

resource "aws_security_group" "default_sg_01" {
  description = "default VPC security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

  name   = "default"
  region = "us-east-1"
  vpc_id = "vpc-0a1f777a3cb6f0ce7"
}

resource "aws_security_group" "default_sg_02" {
  description = "default VPC security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

  name   = "default"
  region = "us-east-1"
  vpc_id = "vpc-0630df329fc4d4f75"
}

# resource "aws_security_group" "eks-cluster-sg-videochat-prod" {
#   description = "EKS created security group applied to ENI that is attached to EKS Control Plane master nodes, as well as any managed workloads."

#   egress {
#     cidr_blocks = ["0.0.0.0/0"]
#     from_port   = "0"
#     protocol    = "-1"
#     self        = "false"
#     to_port     = "0"
#   }

#   ingress {
#     cidr_blocks = ["0.0.0.0/0"]
#     description = " Turn UDP"
#     from_port   = "1024"
#     protocol    = "udp"
#     self        = "false"
#     to_port     = "30000"
#   }

#   ingress {
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "LiveKit TCP"
#     from_port   = "443"
#     protocol    = "tcp"
#     self        = "false"
#     to_port     = "443"
#   }

#   ingress {
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "LiveKit UDP"
#     from_port   = "50000"
#     protocol    = "udp"
#     self        = "false"
#     to_port     = "60000"
#   }

#   # ingress {
#   #   description     = "Allow unmanaged nodes to communicate with control plane (all ports)"
#   #   from_port       = "0"
#   #   protocol        = "-1"
#   #   security_groups = ["${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--eksctl-videochat-prod-cluster-ClusterSharedNodeSecurityGroup-1NWQUEY67OHUE_sg-0e12ab94d9cf14f38_id}"]
#   #   self            = "false"
#   #   to_port         = "0"
#   # }

#   ingress {
#     description      = "LiveKit TCP IPV6"
#     from_port        = "443"
#     ipv6_cidr_blocks = ["::/0"]
#     protocol         = "tcp"
#     self             = "false"
#     to_port          = "443"
#   }

#   ingress {
#     description     = "elbv2.k8s.aws/targetGroupBinding=shared"
#     from_port       = "80"
#     protocol        = "tcp"
#     security_groups = ["${data.terraform_remote_state.sg.outputs.aws_security_group_tfer--k8s-traffic-videochatprod-440636c554_sg-0bc0619f53930ba35_id}"]
#     self            = "false"
#     to_port         = "80"
#   }

#   name   = "eks-cluster-sg-videochat-prod-113357167"
#   region = "us-east-1"

#   tags = {
#     Name                                   = "eks-cluster-sg-videochat-prod-113357167"
#     "kubernetes.io/cluster/videochat-prod" = "owned"
#   }

#   tags_all = {
#     Name                                   = "eks-cluster-sg-videochat-prod-113357167"
#     "kubernetes.io/cluster/videochat-prod" = "owned"
#   }

#   vpc_id = "vpc-0630df329fc4d4f75"
# }

resource "aws_security_group" "eksctl-videochat-prod-cluster-ClusterSharedNodeSecurityGroup" {
  description = "Communication between all nodes in the cluster"
  name        = "eksctl-videochat-prod-cluster-ClusterSharedNodeSecurityGroup-1NWQUEY67OHUE"
  region      = "us-east-1"

  tags = {
    Name                                          = "eksctl-videochat-prod-cluster/ClusterSharedNodeSecurityGroup"
    "alpha.eksctl.io/cluster-name"                = "videochat-prod"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "false"
    "alpha.eksctl.io/eksctl-version"              = "0.167.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "videochat-prod"
  }

  tags_all = {
    Name                                          = "eksctl-videochat-prod-cluster/ClusterSharedNodeSecurityGroup"
    "alpha.eksctl.io/cluster-name"                = "videochat-prod"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "false"
    "alpha.eksctl.io/eksctl-version"              = "0.167.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "videochat-prod"
  }

  vpc_id = "vpc-0630df329fc4d4f75"
}

resource "aws_security_group" "eksctl-videochat-prod-cluster-ControlPlaneSecurityGroup" {
  description = "Communication between the control plane and worker nodegroups"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  name   = "eksctl-videochat-prod-cluster-ControlPlaneSecurityGroup-1O7WG4Z1O166V"
  region = "us-east-1"

  tags = {
    Name                                          = "eksctl-videochat-prod-cluster/ControlPlaneSecurityGroup"
    "alpha.eksctl.io/cluster-name"                = "videochat-prod"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "false"
    "alpha.eksctl.io/eksctl-version"              = "0.167.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "videochat-prod"
  }

  tags_all = {
    Name                                          = "eksctl-videochat-prod-cluster/ControlPlaneSecurityGroup"
    "alpha.eksctl.io/cluster-name"                = "videochat-prod"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "false"
    "alpha.eksctl.io/eksctl-version"              = "0.167.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "videochat-prod"
  }

  vpc_id = "vpc-0630df329fc4d4f75"
}

resource "aws_security_group" "k8s-app" {
  description = "[k8s] Managed SecurityGroup for LoadBalancer"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "443"
    protocol    = "tcp"
    self        = "false"
    to_port     = "443"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "80"
    protocol    = "tcp"
    self        = "false"
    to_port     = "80"
  }

  name   = "k8s-app-7c106c30b0"
  region = "us-east-1"

  tags = {
    "elbv2.k8s.aws/cluster"    = "videochat-prod"
    "ingress.k8s.aws/resource" = "ManagedLBSecurityGroup"
    "ingress.k8s.aws/stack"    = "app"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "videochat-prod"
    "ingress.k8s.aws/resource" = "ManagedLBSecurityGroup"
    "ingress.k8s.aws/stack"    = "app"
  }

  vpc_id = "vpc-0630df329fc4d4f75"
}

resource "aws_security_group" "k8s-traffic-videochatprod" {
  description = "[k8s] Shared Backend SecurityGroup for LoadBalancer"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  name   = "k8s-traffic-videochatprod-440636c554"
  region = "us-east-1"

  tags = {
    "elbv2.k8s.aws/cluster"  = "videochat-prod"
    "elbv2.k8s.aws/resource" = "backend-sg"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"  = "videochat-prod"
    "elbv2.k8s.aws/resource" = "backend-sg"
  }

  vpc_id = "vpc-0630df329fc4d4f75"
}

resource "aws_security_group" "k8s-videocha-videocha" {
  description = "[k8s] Managed SecurityGroup for LoadBalancer"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "443"
    protocol    = "tcp"
    self        = "false"
    to_port     = "443"
  }

  name   = "k8s-videocha-videocha-44af6d46c5"
  region = "us-east-1"

  tags = {
    "elbv2.k8s.aws/cluster"    = "videochat-prod"
    "service.k8s.aws/resource" = "ManagedLBSecurityGroup"
    "service.k8s.aws/stack"    = "videochat/videochat-server-livekit-server-turn"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "videochat-prod"
    "service.k8s.aws/resource" = "ManagedLBSecurityGroup"
    "service.k8s.aws/stack"    = "videochat/videochat-server-livekit-server-turn"
  }

  vpc_id = "vpc-0630df329fc4d4f75"
}

resource "aws_security_group" "launch-wizard" {
  description = "launch-wizard-1 created 2024-12-04T10:38:46.948Z"
  name   = "launch-wizard-1"
  region = "us-east-1"
  vpc_id = "vpc-0a1f777a3cb6f0ce7"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "3389"
    protocol    = "tcp"
    self        = "false"
    to_port     = "3389"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "443"
    protocol    = "tcp"
    self        = "false"
    to_port     = "443"
  }

}

# import {
#   to = aws_security_group.default
#   id = "sg-04a131eed31e0c3f4"
# }

# import {
#   to = aws_security_group.default_sg_01
#   id = "sg-09b72c81e6ebc7e4a"
# }

# import {
#   to = aws_security_group.default_sg_02
#   id = "sg-0c6c5ae03505a5142"
# }

# import {
#   to = aws_security_group.eksctl-videochat-prod-cluster-ClusterSharedNodeSecurityGroup
#   id = "sg-0e12ab94d9cf14f38"
# }

# import {
#   to = aws_security_group.eksctl-videochat-prod-cluster-ControlPlaneSecurityGroup
#   id = "sg-025c14352778e8a11"
# }

# import {
#   to = aws_security_group.k8s-app
#   id = "sg-0a06a6481a635d4a1"
# }

# import {
#   to = aws_security_group.k8s-traffic-videochatprod
#   id = "sg-0bc0619f53930ba35"
# }

# import {
#   to = aws_security_group.k8s-videocha-videocha
#   id = "sg-0524a522615780a3e"
# }

# import {
#   to = aws_security_group.launch-wizard
#   id = "sg-03c02e33a21e51d7d"
# }
