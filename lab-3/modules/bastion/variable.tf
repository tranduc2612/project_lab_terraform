variable "bastion_ami" {
  type    = string
  default = "ami-0e34b50e714a297f1"
}

variable "bastion_instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type    = string
  default = "my-key"
}

variable "subnet_id" {
  type = string
}

variable "sg_id" {
  type = string
}