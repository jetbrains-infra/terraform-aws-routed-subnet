variable "name" {
  description = "Network name, 'RDS' or 'App' e.g."
}

variable "zone" {
  default = "eu-west-1a"
}

variable "type" {
  description = "Network type: 'private' or 'public'"
  default     = "private"
}

variable "subnet_cidr" {
  description = "Subnet CIDR."
}

variable "route_table" {
  description = "Route table id."
}

data "aws_route_table" "current" {
  route_table_id = local.route_table
}

locals {
  route_table = var.route_table
  vpc_id      = data.aws_route_table.current.vpc_id
  subnet_cidr = var.subnet_cidr
  name        = var.name
  type        = lower(var.type)
  az          = var.zone

  tags = {
    Name         = local.name
    Type         = local.type
    Module       = "Subnet"
    ModuleSource = "https://github.com/jetbrains-infra/terraform-aws-routed-subnet/"
  }
}
