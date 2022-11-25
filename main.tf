provider "aws" {
  region     = "us-east-1"
  }

  resource "aws_vpc" "nallabirudu95" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default" 
  tags = {
    Name = "surya"
  }
}

resource "aws_internet_gateway" "pawan" {
    vpc_id = "${aws_vpc.nallabirudu95.id}"
	tags = {
        Name = "narendra"
    }

depends_on = [
    aws_s3_bucket.statebucket,
  ]
}
