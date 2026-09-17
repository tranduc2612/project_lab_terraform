output "bastion_public_ip" {
  description = "bastion public IP"
  value       = aws_instance.bastion.public_ip
}