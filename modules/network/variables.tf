variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "deploy_env" {
  type        = string
  description = "Deployment Environment"
}

variable "public_subnet_cidr" {
    description = "CIDR block for Public Subnet"
    default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
    description = "CIDR block for Private Subnet"
    default = "10.0.1.0/24"
}

variable "tags" {
  description = "Default Tags"
  type        = map(string)
  default     = {}
}