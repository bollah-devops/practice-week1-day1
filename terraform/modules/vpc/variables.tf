variable "vpc_cidr" {
    description = "CIDR block for the VPC"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
}

variable "private_subnet_cidr" {
  description = "CIDR for private subnet"
}

variable "env_name" {
  description = "Eviroment name e.g. staging"
}


variable "az" {
  description = "Availability zone"
  type = string
}

variable "project_name" {
  description = "Project name"
  type = string
}