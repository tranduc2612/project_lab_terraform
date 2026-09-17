module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 6.12"

  identifier = "demodb"

  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = var.mysql_instance_type
  allocated_storage = 5

  db_name  = var.db_name
  username = var.username
  port     = 3306

  manage_master_user_password = true

  iam_database_authentication_enabled = true

  vpc_security_group_ids = [
    var.sg_id
  ]


  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = var.private_subnet_ids

  # DB parameter group
  family = "mysql8.0"

  # DB option group
  major_engine_version = "8.0"

  # Database Deletion Protection
  deletion_protection = true

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]

}
