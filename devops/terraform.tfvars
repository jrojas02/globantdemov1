region = "us-east-1"
cluster_name = "my-dev-cluster"
task_family = "trapecio-task-family"
task_cpu = 256
task_memory = 512
container_port = 80
host_port = 80
service_name = "trapecio-service"
desired_count = 1
container_name = "trapecio-container"

subnets = "subnet-12345678"
security_groups = "sg-12345678"
task_image = "trapecio-image"
execution_role_arn = "arn:aws:iam::123456789012:role/your-execution-role"
task_role_arn = "arn:aws:iam::123456789012:role/your-task-role"
target_group_arn = "arn:aws:elasticloadbalancing:region:123456789012:targetgroup/your-target-group"
