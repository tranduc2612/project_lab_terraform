terraform {
	required_providers {
		aws = {
			source  = "hashicorp/aws"
			version = "~> 5.0"
		}
	}
}


provider "aws" {
	region = "us-east-1"
}

resource "aws_key_pair" "key-pair" {
    key_name   = "my-key-pair"
    public_key = file("./keypair.pub")
}

module "security" {
  source = "./modules/security"
  name-sg = "test-sg"
  description-sg = "Test security group"
}
module "compute" {
  source = "./modules/compute"
  key_name = aws_key_pair.key-pair.key_name
  // instance_type = var.instance_type
  sg_ec2_ids = [module.security.sg-id]
}
