resource "aws_ecs_service" "trapecio_service" {
  name            = var.service_name
  cluster         = var.cluster_id
  task_definition = var.task_definition
  desired_count   = var.desired_count
  launch_type     = "EC2"

  network_configuration {
    subnets          = var.subnets
    security_groups  = var.security_groups
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "trapecio_task"
    container_port   = var.container_port
  }

  depends_on = [aws_ecs_task_definition.trapecio_task]
}
