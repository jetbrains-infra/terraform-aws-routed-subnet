variable "vpc_id" {
  description = "ID of your VPC."
}
variable "project" {
  description = "Project tag"
}
variable "name" {
  description = "Prefix of your network name, 'RDS' or 'App' e.g."
}
variable "zone" {
  default = "eu-west-1a"
}
variable "type" {
  description = "Network type: 'private' or 'public'"
  default     = "private"
}
variable "group" {
  description = "Group tag. You may specify it to define varous scopes for subnets of one type."
  default     = "common"
}
variable "shift" {
  description = "How many subnets were already taken from VPC cidr block."
  default     = 0
}
variable "network_mask" {
  description = "Network mask in bites. 2 for /24 e.g. Default is 2 (256 IPs for subnet in VPC with /22 CIDR)."
  default     = 2
}
variable "route_table" {
  description = "Route table id for public networks."
  default     = ""
}
data "aws_vpc" "default" {
  id = "${local.vpc_id}"
}

locals {
  project     = "${var.project}"
  route_table = "${var.route_table}"
  vpc_id      = "${var.vpc_id}"
  vpc_cidr    = "${data.aws_vpc.default.cidr_block}"
  newbites    = "${var.network_mask}"
  subnet_cidr = "${cidrsubnet(local.vpc_cidr, local.newbites, var.shift)}" // var.shift because local.shift will not work
  purpose     = "${title(var.name)}"
  name        = "${local.purpose} ${var.type}"
  type        = "${lower(var.type)}"
  group       = "${var.group}"
  az          = "${var.zone}"
}
