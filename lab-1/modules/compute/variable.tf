variable "image_id" {
    type = string
    default = "ami-081b0a6eac00b4f53"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "key_name" {
  type = string
  description = "name of the keypair to use for the instance"
  nullable = false
}

variable "sg_ec2_ids" {
  type = list(string)
  description = "list of security group IDs to associate with the instance"
  nullable = false
}