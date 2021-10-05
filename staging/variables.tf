variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "appname" {
  type        = string
  description = "Fake-product-staging"
  default     = "Fake-product-staging"
}

variable "deploy_env" {
  type        = string
  description = "staging"
  default     = "staging"
}

variable "vpc_cidr" {
  type        = string
  description = "staging"
  default     = "10.0.0.0/16"
}
