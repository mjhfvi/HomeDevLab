resource "aws_subnet" "main" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.cidr_block
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.prefix}-${var.instance_name}-subnet"
  }
}

# resource "aws_route_table_association" "main" {
#   subnet_id      = aws_subnet.main.id
#   route_table_id = var.route_table_id
# }