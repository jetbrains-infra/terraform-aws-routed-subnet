variable "vpc_id" {
  description = "ID of your VPC."
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
variable "shift" {
  description = "How many subnets were already taken from VPC cidr block."
  default     = 0
}
variable "network_mask" {
  description = "Network mask in bites. 8 for /24 e.g. Default is 8 (256 IPs)."
  default     = 8
}
variable "route_table" {
  description = "Route table id for public networks."
  default     = ""
}
data "aws_vpc" "default" {
  id = "${local.vpc_id}"
}

locals {
  route_table    = "${var.route_table}"
  vpc_id         = "${var.vpc_id}"
  vpc_cidr       = "${data.aws_vpc.default.cidr_block}"
  shift          = "${local.shift}"
  newbites       = "${var.network_mask}"
  vpc_cidr_block = "${cidrsubnet(local.vpc_cidr, local.newbites, local.shift)}"
  purpose        = "${title(var.name)}"
  name           = "${local.purpose} ${var.type}"
  type           = "${lower(var.type)}"
  az             = "${var.zone}"
}
