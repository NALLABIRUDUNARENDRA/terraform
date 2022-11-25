resource "aws_subnet" "subnet1-public" {
    vpc_id = "${aws_vpc.nallabirudu95.id}"
    cidr_block = "${var.public_subnet1_cidr}"
    availability_zone = "us-east-1a"

    tags = {
        Name = "${var.public_subnet1_name}"
    }
	
    depends_on = [
    aws_flow_log.vpcflowlogs,
  ]
}


resource "aws_subnet" "subnet2-public" {
    vpc_id = "${aws_vpc.nallabirudu95.id}"
    cidr_block = "${var.public_subnet2_cidr}"
    availability_zone = "us-east-1b"

    tags = {
        Name = "${var.public_subnet2_name}"
    }
	depends_on = [
    aws_flow_log.vpcflowlogs,
    aws_subnet.subnet1-public,
    aws_internet_gateway.pawan,
  ]
}

resource "aws_subnet" "subnet3-public" {
    vpc_id = "${aws_vpc.nallabirudu95.id}"
    cidr_block = "${var.public_subnet3_cidr}"
    availability_zone = "us-east-1c"

    tags = {
        Name = "${var.public_subnet3_name}"
    }
	depends_on = [
    aws_flow_log.vpcflowlogs,
    aws_subnet.subnet2-public,
  ]
}