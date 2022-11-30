provider "aws" {
  region     = "${var.region}"
  }

  resource "aws_vpc" "nallabirudu95" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default" 
  tags = {
    Name = "surya"
    enviroment = "production"
  }
}

resource "aws_internet_gateway" "pawan" {
    vpc_id = "${aws_vpc.nallabirudu95.id}"
	tags = {
        Name = "narendra"
    }
}
