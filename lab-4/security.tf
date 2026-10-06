resource "aws_security_group" "ecs-sg" {
  name        = "calculator-ecs-sg"
  description = "Security group for ECS Fargate"
  vpc_id      = aws_vpc.caculator-vpc.id

  # Allow HTTP
  ingress {
    description     = "Allow HTTP"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  # Allow outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "calculator-ecs-sg"
  }
}

resource "aws_security_group" "alb_sg" {
  name        = "calculator-alb-sg"
  description = "Security group for Application Load Balancer"
  vpc_id      = aws_vpc.caculator-vpc.id

  ingress {
    description = "Allow HTTP from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "calculator-alb-sg"
  }
}