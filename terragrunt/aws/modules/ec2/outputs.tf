output "id" {
  value = aws_instance.ec2.id
}

output "public_ip" {
  value = aws_instance.ec2.public_ip
}

# output "image_id" {
#   value = data.aws_ami.ubuntu22.id
# }

output "current_aws_region" {
  value = data.aws_region.current.region
}

output "private_ip" {
  value = aws_instance.ec2.private_ip
}

# output "private_dns" {
#   value = aws_instance.ec2.private_dns
# }

# output "public_dns" {
#   value = aws_instance.ec2.public_dns
# }
