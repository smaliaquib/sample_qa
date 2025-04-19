variable "aws_region" {
  description = "AWS region for the resources"
  type        = string
  default     = "us-east-1" # Or your preferred default region
}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
  sensitive   = true # Mark as sensitive to prevent exposure in outputs/logs
  # No default - should be provided securely (e.g., via environment variables or tfvars)
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
  sensitive   = true # Mark as sensitive
  # No default - should be provided securely
}