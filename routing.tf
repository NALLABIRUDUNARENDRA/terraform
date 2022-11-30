resource "aws_route_table" "public-routing-table" {
  vpc_id = "${aws_vpc.nallabirudu95.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.pawan.id}"
  }

  tags = {
    "name" = "public-routing-table"
  }

}

resource "aws_route_table" "private-routing-table" {
  vpc_id = "${aws_vpc.nallabirudu95.id}"

  
  tags = {
    "name" = "private-routing-table"
  }

}


resource "aws_route_table_association" "terraform-public" {
    count = "${length(var.public_cidrs)}"
  subnet_id      = "${aws_subnet.public-subnets[count.index].id}"
  route_table_id = "${aws_route_table.public-routing-table.id}"
}

resource "aws_route_table_association" "terraform-private" {
    count = "${length(var.private_cidrs)}"
  subnet_id      = "${aws_subnet.private-subnets[count.index].id}"
  route_table_id = "${aws_route_table.private-routing-table.id}"
}