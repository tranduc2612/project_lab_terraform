resource "aws_ecs_cluster" "calculator" {
  name = "calculator-cluster"

  tags = {
    Name = "calculator-cluster"
  }
}