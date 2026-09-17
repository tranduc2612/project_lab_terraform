output "application_sg_id" {
  description = "web server sg id"
  value       = aws_security_group.application.id
}

output "alb_sg_id" {
  description = "alb sg id"
  value       = aws_security_group.alb.id
}

output "mysql_sg_id" {
  description = "mysql sg id"
  value       = aws_security_group.mysql.id
}

output "bastion_sg_id" {
  description = "bastion sg id"
  value       = aws_security_group.bastion.id
}
