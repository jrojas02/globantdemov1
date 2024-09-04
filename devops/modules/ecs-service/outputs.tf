output "service_arn" {
  description = "ARN of the ECS service"
  value       = aws_ecs_service.trapecio_service.arn
}
