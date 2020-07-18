## About
Terraform module to create network subnet with custom route table.

Features:
* Assign route table to forward traffic through NAT or IGW e.g.

## Usage

A private subnet:
```hcl
module "subnet" {
  source      = "github.com/jetbrains-infra/terraform-aws-subnet"
  name        = "App"
  subnet_cidr = "10.0.0.0/24"
  route_table = aws_route_table.internet_access.id
}
```

All options with default values:
```hcl
module "subnet" {
  source       = "github.com/jetbrains-infra/terraform-aws-subnet"
  name         = "DB" // required
  subnet_cidr  = "10.0.0.0/24" // required
  zone         = "eu-west-1a"
  type         = "private"
  route_table  = "aws_route_table.internet_access.id"
  tags         = {
    Owner    = "Don John",
    Project  = "Alice"
    Customer = "Umbrella Corp."
  } 
}
```

## Outputs

* `id` - subnet id 
* `cidr` - CIDR
* `arn` - subnet ARN