variable "region" {
  type = string
}
variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}
variable "public_subnet_ips" {
  type     = list(string)
  nullable = false
}
variable "private_subnet_ips" {
  type     = list(string)
  nullable = false
}
variable "availability_zone_1" {
  description = "Availability Zone for the first subnet"
  type        = string
}

variable "availability_zone_2" {
  description = "Availability Zone for the second subnet"
  type        = string
}