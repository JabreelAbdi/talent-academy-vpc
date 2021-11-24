# VPC CIDR
variable "vpc_cidr" {
    description = "The CIDR of my VPC"
    type = string
  
}

# VPC NAME
variable "vpc_name" {
    description = "The name of my VPC"
    type = string 
}

# IGW
variable "internet_gateway" {
    description = "the name of my internet gateway"
    type = string
}

# REGION LOCATION
variable "region" {
    description = "default region for our VPC"
    type = string
}

# PUBLIC SUBNET CIDR's
variable "public_a_cidr" {
    description = "cidr of public subnet a"
    type = string
  
}

variable "public_b_cidr" {
    description = "cidr of public subnet b"
    type = string
  
}

variable "public_c_cidr" {
    description = "cidr of public subnet c"
    type = string
  
}

# PRIVATE SUBNET CIDR's
variable "private_a_cidr" {
    description = "cidr of private subnet a"
    type = string
  
}

variable "private_b_cidr" {
    description = "cidr of private subnet b"
    type = string
  
}

variable "private_c_cidr" {
    description = "cidr of private subnet c"
    type = string
  
}
