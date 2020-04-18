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
variable "subnet_cidr" {
  description = "Subnet CIDR."
}
variable "route_table" {
  description = "Route table id."
}
data "aws_vpc" "default" {
  id = local.vpc_id
}

locals {
  project     = var.project
  route_table = var.route_table
  vpc_id      = var.vpc_id
  vpc_cidr    = data.aws_vpc.default.cidr_block
  subnet_cidr = var.subnet_cidr
  purpose     = title(var.name)
  name        = "${local.purpose} ${var.type}"
  type        = lower(var.type)
  group       = var.group
  az          = var.zone
}
