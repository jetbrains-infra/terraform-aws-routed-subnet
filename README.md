## About
Terraform module to create network subnet. 

Features:
* Assign route table
* Network calculation based on VPC CIDR

## Usage

Private subnet:
```
module "subnet" {
  source  = "github.com/jetbrains-infra/terraform-aws-subnet"
  project = "FooBar" // required
  vpc_id  = "${local.vpc_id}" // required
  name    = "DB" // required
}
```

All options with default values:
```
module "subnet" {
  source       = "github.com/jetbrains-infra/terraform-aws-subnet"
  project = "FooBar" // required
  vpc_id       = "${local.vpc_id}" // required
  name         = "DB" // required
  zone         = "eu-west-1a"
  type         = "private"
  shift        = 0 // How many subnets were already taken from VPC cidr block
  network_mask = 8 // means 256 IP 
  route_table  = "${aws_route_table.intenert_access.id}"
}
```

## Outputs

* `id` - subnet id 
