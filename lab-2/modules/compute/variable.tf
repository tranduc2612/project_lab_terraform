variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "image" {
  type    = string
  default = ""
}

variable "tag_name" {
  type    = string
  default = ""
}

variable "key_name" {
  type    = string
  default = ""
}
variable "ec2_security_group_ids" {
  type     = list(string)
  nullable = false
}
variable "subnet_id" {
  type     = string
  nullable = false
}
