# Source: https://github.com/terraform-aws-modules/terraform-aws-eks

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.15.1"

  name               = var.environment_name   # set values in terragrunt.hcl
  kubernetes_version = var.kubernetes_version # set values in terragrunt.hcl

  vpc_id                   = var.vpc_id                                                 # set values in terragrunt.hcl
  subnet_ids               = [var.vpc_subnet_private_id_a, var.vpc_subnet_private_id_b] # set values in terragrunt.hcl
  control_plane_subnet_ids = [var.vpc_subnet_private_id_a, var.vpc_subnet_private_id_b] # set values in terragrunt.hcl

  # Create just the IAM resources for EKS Auto Mode for use with custom node pools
  create_auto_mode_iam_resources = true

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  # Optional: Enable public endpoint access for the EKS cluster
  endpoint_public_access = var.endpoint_public_access # set values in terragrunt.hcl

  # # Optional, CloudWatch log group name for EKS cluster logs, if not provided, a default log group will be created with the name /aws/eks/${var.environment_name}/cluster-logs
  # cloudwatch_log_group_name = "/aws/eks/${var.environment_name}/cluster-logs"

  # Optional: Determines whether to create a security group for the node groups or use the existing node_security_group_id
  create_node_security_group = true
  # security_group_additional_rules = {
  #     hybrid-all = {
  #     cidr_blocks = [var.cidr_default] # Allow all traffic from VPC CIDR
  #     description = "Allow all traffic from remote node/pod network"
  #     from_port   = 0
  #     to_port     = 0
  #     protocol    = "all"
  #     type        = "ingress"
  #     }
  # }

  # EKS Addons
  addons = {
    vpc-cni = {             # Optional, The add-on creates elastic network interfaces and attaches them to your Amazon EC2 nodes. The add-on also assigns a private IPv4 or IPv6 address from your VPC to each Pod
      before_compute = true # true: Ensure creation and updated before any compute resources are created, false: Do not ensure creation and updated before any EC2 instances are created
      # resolve_conflicts = "PRESERVE" # OVERWRITE: If conflict exists, preserve conflicting fields on the cluster, PRESERVE: If conflict exists, override conflicting fields with values from the EKS API, NONE: If conflict exists, no changes are made (default)
      # addon_version = "v1.20.4-eksbuild.1" # Working version for EKS 1.34
      timeouts = {
        create = "10m"
        delete = "5m"
        update = "10m"
      }
    }
    eks-pod-identity-agent = { # Optional, Amazon EKS Pod Identity associations provide the ability to manage credentials for your applications, similar to the way that Amazon EC2 instance profiles provide credentials to Amazon EC2 instances.
      before_compute = true
      # resolve_conflicts = "PRESERVE"
      # addon_version = "v1.3.9-eksbuild.5" # Working version for EKS 1.34
      timeouts = {
        create = "10m"
        delete = "5m"
        update = "10m"
      }
    }
    kube-proxy = {  # maintains network rules on your nodes and enables network communication to your Pods.
      before_compute = true
      # resolve_conflicts = "PRESERVE"
      # addon_version = "v1.34.0-eksbuild.4" # Working version for EKS 1.34
      timeouts = {
        create = "10m"
        delete = "5m"
        update = "10m"
      }
    }
    coredns = {              # extensible DNS server that can serve as the Kubernetes cluster DNS
      before_compute = false # true: Ensure creation and updated before any EC2 instances are created, false: Do not ensure creation and updated before any EC2 instances are created
      resolve_conflicts = "NONE" # OVERWRITE: If conflict exists, preserve conflicting fields on the cluster, PRESERVE: If conflict exists, override conflicting fields with values from the EKS API, NONE: If conflict exists, no changes are made (default)
      preserve = true # preserve is a boolean that can be set to true to preserve all fields of the addon if it already exists, this is useful for addons that are managed outside of Terraform or have manual changes that should not be overwritten, if resolve_conflicts is set to NONE and preserve is set to false, then no changes will be made to the addon if it already exists
      # addon_version = "v1.12.4-eksbuild.1" # Working version for EKS 1.34
      timeouts = {
        create = "10m"
        delete = "5m"
        update = "5m"
      }
    }
    # aws-ebs-csi-driver = {
    #   before_compute    = false
    #   resolve_conflicts = "OVERWRITE" # OVERWRITE, PRESERVE, NONE
    #   # addon_version = "v1.52.1-eksbuild.1"
    #   service_account_role_arn = "arn:aws:iam::${var.account_id}:role/AmazonEKS_EBS_CSI_DriverRole-20260101135557956500000001"
    #   timeouts = {
    #     create = "15m"
    #     delete = "5m"
    #     update = "10m"
    #   }
    # }
    # aws-efs-csi-driver       = { # Amazon Elastic File System Container Storage Interface (CSI) Driver
    #     before_compute = false # true: Ensure creation and updated before any EC2 instances are created, false: Do not ensure creation and updated before any EC2 instances are created
    #     # resolve_conflicts = "OVERWRITE" # OVERWRITE: If conflict exists, preserve conflicting fields on the cluster, PRESERVE: If conflict exists, override conflicting fields with values from the EKS API, NONE: If conflict exists, no changes are made (default)
    #     # addon_version = "v2.1.13-eksbuild.1" # Working version for EKS 1.34
    #     timeouts = {
    #         create = "5m"
    #         delete = "5m"
    #         update = "5m"
    #     }
    # }
    # cert-manager = { # Optional, end-to-end encryption can be complex and you need to manage certificates for each asset in your microservices architecture
    #   before_compute = false
    #   # resolve_conflicts = "OVERWRITE" # OVERWRITE, PRESERVE, NONE
    #   # addon_version = "v1.19.1-eksbuild.1"
    #   timeouts = {
    #     create = "5m"
    #     delete = "5m"
    #     update = "5m"
    #   }
    # }
    # prometheus-node-exporter = { # Optional, exporter for Prometheus to collect node-level metrics, can cause ImagePullBackOff issues
    #   before_compute = true
    #   # resolve_conflicts = "PRESERVE" # OVERWRITE, PRESERVE, NONE
    #   # addon_version = "v1.10.2-eksbuild.2"
    #   timeouts = {
    #     create = "10m"
    #     delete = "5m"
    #     update = "10m"
    #   }
    # }
    metrics-server = { # Optional, aggregator of resource usage data in your cluster, and it isn’t deployed by default in Amazon EKS clusters
      before_compute = false
      # resolve_conflicts = "OVERWRITE" # OVERWRITE, PRESERVE, NONE
      # addon_version = "v0.8.0-eksbuild.3"
      timeouts = {
        create = "10m"
        delete = "5m"
        update = "5m"
      }
    }
    # amazon-cloudwatch-observability = { # Optional, provides observability for your Amazon EKS clusters using Amazon CloudWatch
    #     before_compute = true
    #     # resolve_conflicts = "OVERWRITE" # OVERWRITE, PRESERVE, NONE
    #     # addon_version = "v4.7.0-eksbuild.1"
    #     timeouts = {
    #         create = "10m"
    #         delete = "5m"
    #         update = "5m"
    #     }
    # }
    # eks-node-monitoring-agent = {
    #     before_compute = true
    #     # resolve_conflicts = "OVERWRITE" # OVERWRITE, PRESERVE, NONE
    #     # addon_version = "v1.4.2-eksbuild.1"
    #     timeouts = {
    #         create = "10m"
    #         delete = "5m"
    #         update = "5m"
    #     }
    # }
    # kube-state-metrics = {
    #     before_compute = false
    #     # resolve_conflicts = "OVERWRITE" # OVERWRITE, PRESERVE, NONE
    #     # addon_version = "v2.17.0-eksbuild.3"
    #     timeouts = {
    #         create = "10m"
    #         delete = "5m"
    #         update = "5m"
    #     }
    # }
  }

  # EKS Auto Mode Compute Configuration
  compute_config = { # Due to the current EKS Auto Mode API, to disable EKS Auto Mode you will have to explicitly set: compute_config = { enabled = false }
    enabled    = true
    node_pools = ["system"] # Default instance type = c6a.large
  }

  # # EKS Provisioned Control Plane configuration
  # # Configuration block for the EKS Provisioned Control Plane scaling tier. Valid values for tier are standard, tier-xl, tier-2xl, and tier-4xl
  # control_plane_scaling_config = {
  #   tier = "tier-xl"
  # }

  # EKS Managed Node Group(s)
  eks_managed_node_groups = {
      system = {
          create = true # set values in terragrunt.hcl
          name = "system" # Optional, auto-generated if not provided
          # Starting Version 1.30, AL2023 is the default AMI type for EKS managed node groups
          # name_prefix    = "system-use"
          ami_type       = "AL2023_x86_64_STANDARD" # https://github.com/awslabs/amazon-eks-ami/releases
          instance_types = ["m6i.large"] # m6i.large, m6i.xlarge, https://aws.amazon.com/ec2/instance-types/m6i/

          min_size     = 3
          max_size     = 7
          desired_size = 3

          # enable_monitoring = true

          # node_repair_config = {
          #     enabled = true
          #     # max_unhealthy_percentage = 50
          # }

          labels = {
              "octopus.infrastructure.as.code/node-instance-purpose" = "system-pool"
          }
      }

      general-purpose = {
          create = var.create_general_purpose # set values in terragrunt.hcl
          name = "general-purpose" # Optional, auto-generated if not provided
          # Starting Version 1.30, AL2023 is the default AMI type for EKS managed node groups
          # name_prefix    = "large-memory-use"
          ami_type       = "AL2023_x86_64_STANDARD" # https://github.com/awslabs/amazon-eks-ami/releases
          instance_types = ["m6i.xlarge"] # m6i.large, m6i.xlarge, https://aws.amazon.com/ec2/instance-types/m6i/

          min_size     = 2
          max_size     = 5
          desired_size = 2

          # enable_monitoring = true

          # node_repair_config = {
          #     enabled = true
          #     # max_unhealthy_percentage = 50
          # }

          # use_custom_launch_template = false
          disk_size = 50 # Optional, default is 20 GiB, https://docs.aws.amazon.com/eks/latest/userguide/managed-node-groups.html#managed-node-group-storage

          block_device_mappings = {
            xvda = {
              device_name = "/dev/xvda"
              ebs = {
                volume_size = 50
              }
            }
          }

          labels = {
              "octopus.infrastructure.as.code/node-instance-purpose" = "general-purpose-pool"
          }
      }

      general-purpose-arm = {
          create = var.create_general_purpose_arm # set values in terragrunt.hcl
          name = "general-purpose-arm" # Optional, auto-generated if not provided
          # Starting Version 1.30, AL2023 is the default AMI type for EKS managed node groups
          # name_prefix    = "large-memory-use"
          ami_type       = "AL2023_x86_64_STANDARD" # https://github.com/awslabs/amazon-eks-ami/releases
          instance_types = ["c8g.2xlarge"] # c8g.xlarge, c8g.2xlarge, https://aws.amazon.com/ec2/instance-types/c8g/

          min_size     = 2
          max_size     = 5
          desired_size = 2

          # enable_monitoring = true

          # node_repair_config = {
          #     enabled = true
          #     # max_unhealthy_percentage = 50
          # }

          labels = {
              "octopus.infrastructure.as.code/node-instance-purpose" = "general-purpose-arm-pool"
          }
      }

      # gpu-purpose = {
      #     create = var.create_gpu_purpose # set values in terragrunt.hcl
      #     name = "gpu-pool" # optional, auto-generated if not provided
      #     # Starting Version 1.30, AL2023 is the default AMI type for EKS managed node groups
      #     # name_prefix    = "gpu-use"
      #     ami_type       = "AL2023_x86_64_STANDARD" # https://github.com/awslabs/amazon-eks-ami/releases
      #     instance_types = ["g4dn.xlarge"] # g4dn.xlarge, g4dn.2xlarge, https://aws.amazon.com/ec2/instance-types/g4/

      #     min_size     = 0
      #     max_size     = 2
      #     desired_size = 1

      #     enable_monitoring = true

      #     # node_repair_config = {
      #     #     enabled = true
      #     #     # max_unhealthy_percentage = 50
      #     # }

      #     labels = {
      #         "octopus.infrastructure.as.code/node-instance-purpose" = "gpu-purpose-pool"
      #     }
      # }
  }

  self_managed_node_groups = {
      gpu-purpose = {
          create = var.create_gpu_purpose # set values in terragrunt.hcl
          name = "gpu-pool" # Optional, auto-generated if not provided
          # Starting Version 1.30, AL2023 is the default AMI type for EKS managed node groups
          # name_prefix    = "gpu-use"
          ami_type       = "AL2023_x86_64_STANDARD" # https://github.com/awslabs/amazon-eks-ami/releases
          instance_type = "g4dn.xlarge" # g4dn.xlarge, g4dn.2xlarge, https://aws.amazon.com/ec2/instance-types/g4/

          min_size     = 1
          max_size     = 2
          desired_size = 1

          enable_monitoring = true

          # node_repair_config = {
          #     enabled = true
          #     # max_unhealthy_percentage = 50
          # }

          labels = {
              "octopus.infrastructure.as.code/node-instance-purpose" = "gpu-purpose-pool"
          }
      }
  }

  timeouts = {
    create = "20m"
    update = "25m"
    delete = "10m"
  }

  deletion_protection = var.deletion_protection # set values in terragrunt.hcl

  tags = {
    Resource = "terraform-aws-modules/eks/aws"
  }
}
