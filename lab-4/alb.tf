resource "aws_lb" "calculator-alb" {
  name               = "calculator-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.alb_sg.id
  ]

  subnets = [
    aws_subnet.public-subnet-1.id,
    aws_subnet.public-subnet-2.id,
    aws_subnet.public-subnet-3.id
  ]

  tags = {
    Name = "calculator-alb"
  }
}

resource "aws_lb_target_group" "calculator-target-group" {
  name        = "calculator-target-group"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"

  vpc_id = aws_vpc.caculator-vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    port                = "traffic-port"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
  }

#   stickiness {
#     type            = "lb_cookie"
#     cookie_duration = 3600
#   }

  tags = {
    Name = "calculator-target-group"
  }
}

resource "aws_lb_listener" "calculator-alb-listener" {
  load_balancer_arn = aws_lb.calculator-alb.arn

  port     = 80
  protocol = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.calculator-target-group.arn
  }

  tags = {
    Name = "calculator-alb-listener"
  }
}