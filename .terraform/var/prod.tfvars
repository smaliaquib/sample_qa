#prod.tfvars
aws_region        = "us-east-1"
eks_cluster_name  = "my-eks-cluster"
vpc_id           = "vpc-04ffa64ef9b7f6c35"
subnet_ids       = ["subnet-09783b1226fd9b1dc", "subnet-0367b95ab8581d399", "subnet-0cd08e60b6f506559"]
eks_version       = "1.32"
node_group_name   = "qa-system-nodes"
node_instance_type = "t3.medium"
node_desired_size = 2
node_max_size     = 3
node_min_size     = 1