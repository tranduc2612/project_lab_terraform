module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = var.cidr_block

  azs = var.azs

  public_subnets = [
    "172.16.0.0/24",
    "172.16.1.0/24"
  ]
  private_subnets = [
    "172.16.10.0/24",
    "172.16.11.0/24"
  ]

  enable_nat_gateway     = true
  one_nat_gateway_per_az = true

  tags = {
    Name = "main"
  }
}
