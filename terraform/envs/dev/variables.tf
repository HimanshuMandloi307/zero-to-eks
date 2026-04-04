variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "vpc_name" {
  type    = string
  default = "zero-to-eks-vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "cluster_name" {
  type    = string
  default = "zero-to-eks"
}

variable "azs" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "tags" {
  type    = map(string)
  default = { project = "zero-to-eks", env = "dev" }
}