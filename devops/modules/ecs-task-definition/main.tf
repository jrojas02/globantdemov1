resource "aws_ecs_task_definition" "trapecio_task" {
  family                   = var.family
  container_definitions    = jsonencode([{
    name      = "trapecio-task"
    image     = var.image
    cpu       = var.cpu
    memory    = var.memory
    essential = true
    portMappings = [{
      containerPort = var.container_port
      hostPort      = var.host_port
    }]
  }])
  network_mode             = "awsvpc"
  requires_compatibilities = ["EC2"]
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn
}
