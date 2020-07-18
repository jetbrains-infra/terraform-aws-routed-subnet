resource "aws_subnet" "default" {
  vpc_id                  = local.vpc_id
  cidr_block              = local.subnet_cidr
  availability_zone       = local.az
  map_public_ip_on_launch = local.type == "private" ? false : true
  tags                    = local.tags
}

resource "aws_route_table_association" "internet_access" {
  route_table_id = local.route_table
  subnet_id      = aws_subnet.default.id
}