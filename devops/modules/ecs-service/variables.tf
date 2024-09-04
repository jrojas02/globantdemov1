variable "service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "cluster_id" {
  description = "ID of the ECS cluster"
  type        = string
}

variable "task_definition" {
  description = "ARN of the task definition to use for the service"
  type        = string
}

variable "desired_count" {
  description = "The number of tasks to run in the service"
  type        = number
  default     = 1
}

variable "subnets" {
  description = "List of subnets associated with the task"
  type        = list(string)
}

variable "security_groups" {
  description = "List of security groups to associate with the task"
  type        = list(string)
}

variable "target_group_arn" {
  description = "ARN of the load balancer target group"
  type        = string
}

variable "container_port" {
  description = "Port on which the container is listening"
  type        = number
}

variable "container_name" {
  description = "Name of container"
  type        = string
}
