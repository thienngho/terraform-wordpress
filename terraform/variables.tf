variable "aws_region" {
    default = "ap-southeast-1"
}
variable "environment" {
  default = "dev"
}

variable "app_name" {
  default = "wp"
}
variable "aws_ami" {
  default = "ami-03221428e6676db69"
  description = "The AWS AMI to use"
}

variable "ssh_key" {
  default = "test"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "AWS instance type"
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.10.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  default     = "10.10.0.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for private subnet"
  default     = "10.10.1.0/24"
}

variable "availability_zones" {
  default     = "ap-southeast-1c,ap-southeast-1a,ap-southeast-1b"
  description = "List of availability zones"
}
