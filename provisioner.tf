 resource "null_resource" "cluster" {
   count = "${var.env == "Prod" ? 1:1}"
   provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    connection {
    type = "ssh"
    user ="ubuntu"
    private_key = "${file("terraform2.pem")}"
    #host = "${aws_instance.web-1.*.public_ip}"
    host = "${element(aws_instance.web-1.*.public_ip,count.index)}"

    }
  }
  #remote-exec provisioner
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
      "sudo apt update -y",
      "sudo apt install -y cowsay unzip",
      "cowsay 'wellcom to my home.. comeeeeeeee'"
    ]
     connection {
    type = "ssh"
    user ="ubuntu"
    private_key = "${file("terraform2.pem")}"
    #host = "${aws_instance.web-1.*.public_ip}"
    host = "${element(aws_instance.web-1.*.public_ip,count.index)}"

    }
  }
 }
