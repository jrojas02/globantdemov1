variable "cluster_name" {
  description = "Name of the ECS cluster for dev environment"
  type        = string
  default     = "my-dev-cluster"
}

variable "task_family" {
  description = "Family name for the ECS task definition"
  type        = string
  default     = "trapecio-task"
}

variable "task_image" {
  description = "Docker image for the task"
  type        = string
  # No se define un valor por defecto; se espera que sea proporcionado por el CI/CD o variables específicas del entorno.
}

variable "task_cpu" {
  description = "CPU units for the ECS task"
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "Memory (in MiB) for the ECS task"
  type        = number
  default     = 512
}

variable "container_port" {
  description = "Port on which the container listens"
  type        = number
  default     = 80
}

variable "host_port" {
  description = "Port on the host to map to the container port"
  type        = number
  default     = 80
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
  default     = 1
}

variable "subnets" {
  description = "List of subnets IDs for ECS service"
  type        = list(string)
  default     = ["subnet-12345678"]  # Actualiza con los IDs de tus subnets
}

variable "security_groups" {
  description = "List of security group IDs for ECS service"
  type        = list(string)
  default     = ["sg-12345678"]  # Actualiza con los IDs de tus security groups
}

variable "target_group_arn" {
  description = "ARN of the target group for ECS service"
  type        = string
}
