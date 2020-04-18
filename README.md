## About
Terraform module to create network subnet with custom route tablea

Features:
* Assign route table to forward traffic through NAT or IGW e.g.

## Usage

A private subnet:
```hcl
module "subnet" {
  source      = "github.com/jetbrains-infra/terraform-aws-subnet"
  project     = "FooBar"
  vpc_id      = "${local.vpc_id}" 
  name        = "DB"
  route_table = "${aws_route_table.intenert_access.id}"
}
```

All options with default values:
```hcl
module "subnet" {
  source       = "github.com/jetbrains-infra/terraform-aws-subnet"
  project      = "FooBar" // required
  vpc_id       = "${local.vpc_id}" // required
  name         = "DB" // required
  zone         = "eu-west-1a"
  type         = "private"
  group        = "dbs"
  subnet_cidr  = "10.0.0.0/24"
  route_table  = "${aws_route_table.intenert_access.id}"
}
```

## Outputs

* `id` - subnet id 
* `cidr` - CIDR
* `arn` - subnet ARN