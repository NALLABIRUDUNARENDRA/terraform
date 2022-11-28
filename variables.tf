variable "vpc_cidr" {}

variable "public_subnets"{
    type = list
    default = ["us-east-1a","us-east-1b","us-east-1c"]
}
variable "public_cidrs" {
    type = list
    default = ["10.50.1.0/24","10.50.2.0/24","10.50.3.0/24"]
}

variable "private_subnets"{
    type = list
    default = ["us-east-1a","us-east-1b","us-east-1c"]
}
variable "private_cidrs" {
    type = list
    default = ["10.50.10.0/24","10.50.20.0/24","10.50.30.0/24"]
}