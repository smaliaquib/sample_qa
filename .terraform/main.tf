provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current_identity" {}

# EKS Cluster 
module "eks" {
  source = "./eks"
  cluster_name = "${var.eks_cluster_name}"
  vpc_id = var.vpc_id
  subnet_ids = var.subnet_ids
  node_desired_size = var.node_desired_size
  node_max_size = var.node_max_size
  node_min_size = var.node_min_size
}

output "eks_cluster_name" {
  value = "${var.eks_cluster_name}"
}