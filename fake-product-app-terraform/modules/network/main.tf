resource "aws_vpc" "vpc" {
    cidr_block = "${var.vpc_cidr_block}"
    tags = {
        Name = "${var.deploy_env}"
        Environment = "${var.deploy_env}"
    }
}

/*
  Public Subnet
*/
resource "aws_subnet" "us-east-1a-public" {
    vpc_id = "${aws_vpc.vpc.id}"

    cidr_block = "${var.public_subnet_cidr}"
    availability_zone = "us-east-1a"

    tags = {
        Name = "fake-product-${var.deploy_env}-public-subnet"
        Environment = "${var.deploy_env}"
    }
}

/*
  Private Subnet
*/
resource "aws_subnet" "us-east-1a-private" {
    vpc_id = "${aws_vpc.vpc.id}"

    cidr_block = "${var.private_subnet_cidr}"
    availability_zone = "us-east-1a"

    tags = {
        Name = "fake-product-${var.deploy_env}-private-subnet"
        Environment = "${var.deploy_env}"
    }
}

/*
  Security Groups
*/
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress = [
    {
      description      = "Inbound TLS from VPC"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    }
  ]

  egress = [
    {
      description      = "Outbound traffic"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    }
  ]

  tags = {
    Name = "allow_tls"
  }
}