provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current_identity" {}

# EKS Cluster 
module "eks" {
  source = "./eks"
  cluster_name = "${var.eks_cluster_name}-${var.project_id}"
  vpc_id = var.vpc_id
  subnet_ids = var.subnet_ids
  eks_version = var.eks_version
  node_instance_type = var.node_instance_type
  node_desired_size = var.node_desired_size
  node_max_size = var.node_max_size
  node_min_size = var.node_min_size
}

output "eks_cluster_name" {
  value = "${var.eks_cluster_name}-${var.project_id}"
}