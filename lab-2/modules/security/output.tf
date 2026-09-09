output "public-sg-id" {
  value = aws_security_group.public_security_group.id
}
output "private-sg-id" {
  value = aws_security_group.private_security_group.id
}