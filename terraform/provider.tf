provider "aws" {
  region      = "${var.aws_region}"
}

/* Define vpc */
resource "aws_vpc" "default" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags { 
    Name = "${var.app_name}-${var.environment}"
    Environment = "${var.environment}" 
  }
}