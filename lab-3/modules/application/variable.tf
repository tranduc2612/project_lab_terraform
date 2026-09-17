variable "ami" {
  type    = string
  default = "ami-0e34b50e714a297f1"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type    = string
  default = "my-key"
}

variable "webserver_sg_id" {
  type = string
}
variable "alb_sg_id" {
  type = string
}
variable "public_subnets" {
  type = list(string)
}
variable "private_subnets" {
  type = list(string)
}
variable "max_size" {
  type    = number
  default = 5
}
variable "min_size" {
  type    = number
  default = 2
}
variable "desired_capacity" {
  type    = number
  default = 2
}
variable "mysql_ip" {
  type = string
}
variable "vpc_id" {
  type = string
}