variable "sg_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "db_name" {
  type = string
}

variable "username" {
  type = string
}

variable "mysql_instance_type" {
  type = string
}