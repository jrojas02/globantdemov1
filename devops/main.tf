terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket         = var.s3_bucket
    key            = "terraform/state"
    region         = var.region
  }
}

provider "aws" {
  region = var.region
}

module "ecs_cluster" {
  source = "./modules/ecs-cluster"

  cluster_name = var.cluster_name
}
