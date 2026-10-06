output "vpc_id" {
  value = aws_vpc.caculator-vpc.id
}

output "vpc_cidr_block" {
  value = aws_vpc.caculator-vpc.cidr_block
}

output "public_subnet_1" {
  value = aws_subnet.public-subnet-1.id
}

output "public_subnet_2" {
  value = aws_subnet.public-subnet-2.id
}

output "public_subnet_3" {
  value = aws_subnet.public-subnet-3.id
}

output "private_subnet_1" {
  value = aws_subnet.private-subnet-1.id
}

output "private_subnet_2" {
  value = aws_subnet.private-subnet-2.id
}

output "private_subnet_3" {
  value = aws_subnet.private-subnet-3.id
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.calculator-alb.dns_name
}

output "ecs_cluster_name" {
  description = "ECS Cluster name"
  value       = aws_ecs_cluster.calculator.name
}

output "ecs_service_name" {
  description = "ECS Service name"
  value       = aws_ecs_service.calculator.name
}