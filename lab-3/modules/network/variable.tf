variable "cidr_block" {
  type    = string
  default = "172.16.0.0/16"
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}