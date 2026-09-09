output "instance_public_eip" {
  value = module.compute.instance_ip_addr_public
}

output "instance_private_ip" {
  value = module.compute.instance_ip_addr_private
}

output "security-group" {
  value = module.security.sg-id
}