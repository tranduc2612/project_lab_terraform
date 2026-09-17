terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = ">= 2.3.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

#==========Keypair===================
resource "aws_key_pair" "key_pair" {
  key_name   = "my-key-pair"
  public_key = file("./keypair.pub")
}
#====================================

module "network" {
  source = "./modules/network"

  azs        = var.availability_zones
  cidr_block = var.cidr_block
}

module "storage" {
  source = "./modules/storage"

  sg_id               = module.security.mysql_sg_id
  private_subnet_ids  = module.network.private_subnets
  db_name             = var.db_name
  username            = var.db_username
  mysql_instance_type = var.mysql_instance_type

  depends_on = [
    module.network,
    module.security
  ]
}

#====================================

module "security" {
  source = "./modules/security"

  vpc_id            = module.network.vpc_id
  my_workstation_ip = var.my_workstation_ip

  depends_on = [
    module.network
  ]
}

#====================================

module "bastion" {
  source = "./modules/bastion"

  bastion_instance_type = var.bastion_instance_type
  key_name              = aws_key_pair.key_pair.key_name
  subnet_id             = module.network.public_subnets[0]
  sg_id                 = module.security.bastion_sg_id
  bastion_ami           = var.bastion_ami
  depends_on = [
    module.network,
    module.security
  ]
}


#====================================

module "application" {
  source   = "./modules/application"
  mysql_ip = module.storage.db_instance_endpoint

  instance_type   = var.app_instance_type
  key_name        = aws_key_pair.key_pair.key_name
  vpc_id          = module.network.vpc_id
  public_subnets  = module.network.public_subnets
  private_subnets = module.network.private_subnets
  webserver_sg_id = module.security.application_sg_id
  alb_sg_id       = module.security.alb_sg_id
  ami             = var.app_ami
  depends_on = [
    module.network,
    module.security,
    module.storage
  ]
}

