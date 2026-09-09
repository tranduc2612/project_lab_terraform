output "instance_ip_addr_public" {
  value = module.compute.public_ip
}

output "instance_ip_addr_private" {
  value = module.compute.private_ip
}