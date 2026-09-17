variable "region" {
  type = string
}

variable "my_workstation_ip" {
  type = string
}

variable "cidr_block" {
  type        = string
  description = "VPC cidr block. Example: 10.10.0.0/16"
}

variable "availability_zones" {
  type = list(any)
}

variable "keypair_path" {
  type = string
}
variable "bastion_instance_type" {
  type = string
}
variable "bastion_ami" {
  type = string
}
variable "app_instance_type" {
  type = string
}
variable "app_ami" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "mysql_instance_type" {
  type = string
}