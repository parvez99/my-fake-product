/*

This file manages production resources
Includes network module for setting up AWS VPC

*/

provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "./../modules/network"

  vpc_cidr_block = "10.0.0.0/16"

  deploy_env = "Prod"

}
