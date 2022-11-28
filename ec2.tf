resource "aws_instance" "web-1" {
  count = 3 # 0 ,1 ,2
  ami    =  "ami-08c40ec9ead489470"
  availability_zone ="${element(var.public_subnets, count.index)}"
  instance_type = "t2.nano"
  key_name = "terraform2"
  subnet_id ="${aws_subnet.public-subnets[count.index].id}"
  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true 
  tags = {
    Name = "HelloWorld-${count.index+1}"
   
  }
}

