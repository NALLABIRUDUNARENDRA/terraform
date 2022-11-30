resource "aws_instance" "web-1" {
  count = "${var.env == "Prod" ? 3:1}"
  ami    =  "${lookup(var.amis,var.region)}"
  availability_zone ="${element(var.public_subnets, count.index)}"
  instance_type = "t2.nano"
  key_name = "terraform2"
  subnet_id ="${aws_subnet.public-subnets[count.index].id}"
  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true 
  tags = {
    Name = "HelloWorld-${count.index+1}"
    enviroment ="${var.env}"
   
  }
  user_data = <<-EOF
		#!/bin/bash
        sudo apt-get update
		sudo apt-get install -y nginx
		sudo systemctl start nginx
		sudo systemctl enable nginx
		echo "HelloWorld-${count.index+1}" | sudo tee /var/www/html/index.nginx-debian.html
	EOF
}
