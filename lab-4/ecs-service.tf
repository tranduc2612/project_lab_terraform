resource "aws_ecs_service" "calculator" {
  name            = "calculator-service"
  cluster         = aws_ecs_cluster.calculator.id
  task_definition = aws_ecs_task_definition.calculator.arn

  desired_count = 3

  launch_type = "FARGATE"

  network_configuration {
    subnets = [
      aws_subnet.private-subnet-1.id,
      aws_subnet.private-subnet-2.id,
      aws_subnet.private-subnet-3.id
    ]

    security_groups = [
      aws_security_group.ecs-sg.id
    ]

    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.calculator-target-group.arn
    container_name   = "calculator-task-definition"
    container_port   = 80
  }

  tags = {
    Name = "calculator-service"
  }
}