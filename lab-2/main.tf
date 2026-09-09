terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {
  region = var.region
}

resource "aws_key_pair" "key-pair" {
  key_name   = "my-key-pair"
  public_key = file("./keypair.pub")
}

module "networking" {
  region              = var.region
  source              = "./modules/networking"
  cidr_block          = var.cidr_block
  availability_zone_1 = var.availability_zone_1
  availability_zone_2 = var.availability_zone_2
  public_subnet_ips   = var.public_subnet_ips
  private_subnet_ips  = var.private_subnet_ips
}

module "security" {
  source = "./modules/security"
  region = var.region
  vpc_id = module.networking.vpc_id
}

module "compute" {
  source                 = "./modules/compute"
  key_name               = aws_key_pair.key-pair.key_name
  image                  = var.amis[var.region]
  instance_type          = var.instance_type
  ec2_security_group_ids = [module.security.public-sg-id]
  subnet_id              = module.networking.public_subnet_ids[0]
  tag_name               = "my-instance"
}

