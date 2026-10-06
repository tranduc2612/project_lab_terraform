variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  type        = string
  description = "public subnet 1 CIDR"
}

variable "public_subnet_2_cidr" {
  type        = string
  description = "public subnet 2 CIDR"
}

variable "public_subnet_3_cidr" {
  type        = string
  description = "public subnet 3 CIDR"
}

variable "private_subnet_1_cidr" {
  type        = string
  description = "private subnet 1 CIDR"
}

variable "private_subnet_2_cidr" {
  type        = string
  description = "private subnet 2 CIDR"
}

variable "private_subnet_3_cidr" {
  type        = string
  description = "private subnet 3 CIDR"
}

variable "ecr_image_tag" {
  type        = string
  description = "ECR image tag"
  default     = "latest"
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}