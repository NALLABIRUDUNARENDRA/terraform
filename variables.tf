variable "vpc_cidr" {}
variable "region" {}
variable "env" {}

variable "public_subnets"{
    type = list
    default = ["us-east-1a","us-east-1b","us-east-1c"]
}
variable "public_cidrs" {
    type = list
    default = ["10.50.1.0/24","10.50.2.0/24","10.50.3.0/24","10.50.4.0/24","10.50.5.0/24","10.50.6.0/24"]
}

variable "private_subnets"{
    type = list
    default = ["us-east-1a","us-east-1b","us-east-1c"]
}
variable "private_cidrs" {
    type = list
    default = ["10.50.10.0/24","10.50.20.0/24","10.50.30.0/24","10.50.40.0/24","10.50.50.0/24","10.50.60.0/24"]
}


variable "amis" {
  description = "AMIs by region"
  default = {
    "us-east-1" = "ami-08c40ec9ead489470" # ubuntu 22.04 LTS
    "us-west-2" = "ami-0d5bf08bc8017c83b" # ubuntu 20.04 LTS 
  }
}

