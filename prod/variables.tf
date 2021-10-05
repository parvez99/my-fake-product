variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "appname" {
  type        = string
  description = "fake-product-production"
  default     = "fake-product-production"
}

variable "deploy_env" {
  type        = string
  description = "Prod"
  default     = "Prod"
}

variable "vpc_cidr" {
  type        = string
  description = "Prod"
  default     = "10.0.0.0/16"
}
