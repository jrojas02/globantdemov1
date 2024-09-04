variable "family" {
  description = "Family name for the task definition"
  type        = string
}

variable "image" {
  description = "Docker image to use for the task"
  type        = string
}

variable "cpu" {
  description = "CPU units to allocate to the task"
  type        = number
}

variable "memory" {
  description = "Memory (in MiB) to allocate to the task"
  type        = number
}

variable "container_port" {
  description = "Container port to expose"
  type        = number
}

variable "host_port" {
  description = "Host port to map to the container port"
  type        = number
}

variable "execution_role_arn" {
  description = "IAM role that grants the ECS agent permission to pull images and publish logs"
  type        = string
}

variable "task_role_arn" {
  description = "IAM role that the task can assume"
  type        = string
}
