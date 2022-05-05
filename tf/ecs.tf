
# ALB Security group
# This is the group you need to edit if you want to restrict access to your application


### ECS

resource "aws_ecs_cluster" "main" {
  name = "tf-ecs-cluster"
}

resource "aws_ecs_task_definition" "app" {
  family                   = "app"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = <<DEFINITION
[
  {
    "cpu": 256,
    "image": "alllomancer/fibonacci:latest",
    "memory": 512,
    "name": "app",
    "networkMode": "awsvpc",
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ]
  }
]
DEFINITION
}

resource "aws_ecs_service" "main" {
  name            = "tf-ecs-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = "1"
  launch_type     = "FARGATE"

  network_configuration {
    security_groups = ["${aws_security_group.ecs_tasks.id}"]
    subnets         = ["${data.aws_subnets.private.*.id}"]
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.app.id
    container_name   = "app"
    container_port   = "80"
  }

  depends_on = [
    aws_alb_listener.front_end,
  ]
}