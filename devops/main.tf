

# Terraform and Provider Configuration
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "ecs_cluster" {
  source = "./modules/ecs-cluster" # Ajusta el path al módulo ECS si es diferente

  cluster_name            = var.cluster_name
  task_execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn           = aws_iam_role.ecs_task_role.arn
}

module "ecs_task_definition" {
  source = "./modules/ecs-task-definition"

  family             = var.task_family
  image              = var.task_image
  cpu                = var.task_cpu
  memory             = var.task_memory
  container_port     = var.container_port
  host_port          = var.host_port
  execution_role_arn = var.execution_role_arn
  task_role_arn      = var.task_role_arn
}

module "ecs_service" {
  source           = "./modules/ecs-service"

  service_name     = var.service_name
  cluster_id       = module.ecs_cluster.cluster_id
  task_definition  = module.ecs_task_definition.task_definition_arn
  desired_count    = var.desired_count
  subnets          = var.subnets
  security_groups  = var.security_groups
  target_group_arn = var.target_group_arn
  container_port   = var.container_port
  container_name   = var.container_name
}


resource "aws_iam_role" "ecs_task_execution_role" {
  name = "${var.cluster_name}_task_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role" "ecs_task_role" {
  name = "${var.cluster_name}_task_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      },
    ]
  })
}


