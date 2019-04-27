resource "aws_subnet" "default" {
  vpc_id                  = "${local.vpc_id}"
  cidr_block              = "${local.subnet_cidr}"
  availability_zone       = "${local.az}"
  map_public_ip_on_launch = "${local.type == "private" ? false : true }"

  tags {
    Name    = "${local.name}"
    Project = "${local.project}"
    Type    = "${local.type}"
  }
}

resource "aws_route_table_association" "internet_access" {
  count          = "${local.type == "private" ? 0 : 1}"
  route_table_id = "${local.route_table}"
  subnet_id      = "${aws_subnet.default.id}"
}