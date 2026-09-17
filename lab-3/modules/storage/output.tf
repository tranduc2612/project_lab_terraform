output "db_instance_endpoint" {
  description = "MySQL RDS endpoint"
  value       = module.db.db_instance_endpoint
}

output "db_instance_port" {
  description = "MySQL RDS port"
  value       = module.db.db_instance_port
}