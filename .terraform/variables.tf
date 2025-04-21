# variables.tf
variable "aws_region" {
  description = "AWS region to create resources"
  default     = "us-east-1"
}

variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
}

variable "vpc_id" {
  description = "VPC ID where EKS cluster will be created"
}

variable "subnet_ids" {
  description = "List of subnet IDs for EKS cluster"
  type        = list(string)
}

variable "eks_version" {
  description = "Kubernetes version for EKS cluster"
  default     = "1.32"
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  default     = "eks-nodes"
}

variable "node_instance_type" {
  description = "EC2 instance type for EKS nodes"
  default     = "t3.medium"
}

variable "node_desired_size" {
  description = "Desired number of nodes in the EKS cluster"
  default     = 2
}

variable "node_max_size" {
  description = "Maximum number of nodes in the EKS cluster"
  default     = 3
}

variable "node_min_size" {
  description = "Minimum number of nodes in the EKS cluster"
  default     = 1
}