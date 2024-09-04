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
  source = "../../modules/ecs-cluster"

  cluster_name = var.cluster_name
}

module "ecs_task_definition" {
  source = "../../modules/ecs-task-definition"

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
  source           = "../../modules/ecs-service"

  service_name     = var.service_name
  cluster_id       = module.ecs_cluster.cluster_id
  task_definition  = module.ecs_task_definition.task_definition_arn
  desired_count    = var.desired_count
  subnets          = var.subnets
  security_groups  = var.security_groups
  target_group_arn = var.target_group_arn
  container_port   = var.container_port
}

