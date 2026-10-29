locals {
  name = "${var.prefix}-${var.instance_name}"
}

resource "aws_instance" "ec2" {
  ami = "ami-0ad554caf874569d2"
  # id = "i-019b6879e203bf52e"
  # ami                         = data.aws_ami.ubuntu22.id
  associate_public_ip_address = "true"
  availability_zone           = "us-east-1d"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_options {
    core_count       = "2"
    threads_per_core = "2"
  }

  disable_api_stop        = "false"
  disable_api_termination = "false"
  ebs_optimized           = "true"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = var.instance_type
  # ipv6_address_count                   = "0"
  key_name                             = aws_key_pair.generated_key.key_name

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = "1"
    http_tokens                 = "optional"
    instance_metadata_tags      = "disabled"
  }

  monitoring                 = "false"
  placement_partition_number = "0"

  # primary_network_interface {
  #   network_interface_id = "eni-0577ba754b3712586"
  # }

  private_dns_name_options {
    enable_resource_name_dns_a_record    = "false"
    enable_resource_name_dns_aaaa_record = "false"
    hostname_type                        = "ip-name"
  }

  # private_ip = "10.100.1.220"
  region     = data.aws_region.current.region

  dynamic "root_block_device" {
    for_each = var.use_ebs_root ? [1] : []
    content {
      volume_size           = var.root_volume_size
      volume_type           = var.ebs_volume_type
      delete_on_termination = "true"
      encrypted             = "false"
      iops                  = "3000"
      throughput            = "125"
    }
  }

  # source_dest_check = "true"
  subnet_id         = var.subnet_id

  tags = {
    # Name = "${local.name}-vm"
    Name = "octopus-prod-us-corsight-vm"
  }

  tenancy                = "default"
  user_data             = <<-EOF
                          #!/bin/bash
                          apt-get update
                          apt-get install -y nvidia-headless-550-server nvidia-utils-550-server
                          EOF
  vpc_security_group_ids = [aws_security_group.main.id]
}
