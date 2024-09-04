variable "cluster_name" {
  description = "Name of the ECS cluster for dev environment"
  type        = string
}

variable "task_family" {
  description = "Family name for the ECS task definition"
  type        = string
}

variable "task_image" {
  description = "Docker image for the task"
  type        = string
}

variable "task_cpu" {
  description = "CPU units for the ECS task"
  type        = number
}

variable "task_memory" {
  description = "Memory (in MiB) for the ECS task"
  type        = number
}

variable "container_port" {
  description = "Port on which the container listens"
  type        = number
}

variable "host_port" {
  description = "Port on the host to map to the container port"
  type        = number
}

variable "execution_role_arn" {
  description = "ARN of the execution role for the ECS task"
  type        = string
}

variable "task_role_arn" {
  description = "ARN of the task role for the ECS task"
  type        = string
}

variable "service_name" {
  description = "Name of the ECS service"
  type        = string
  default     = "trapecio-service"
}

variable "desired_count" {
  description = "Desired number of tasks in the service"
  type        = number
}

variable "subnets" {
  description = "List of subnets IDs for ECS service"
  type        = list(string)
}

variable "security_groups" {
  description = "List of security group IDs for ECS service"
  type        = list(string)
}

variable "target_group_arn" {
  description = "ARN of the target group for ECS service"
  type        = string
}
