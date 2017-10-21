resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = "${file("${lookup(var.keys, "publicKey")}")}"
}

resource "aws_instance" "frontal" {
  count                  = "${length(split(",", lookup(var.machine, "machinename")))}"
  ami                    = "ami-785db401"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${var.securityGroup}"]
  key_name               = "${aws_key_pair.mykey.key_name}"

  user_data              = "${element(data.template_file.script.*.rendered, count.index)}"

  tags {
    Name = "${element(split(",", lookup(var.machine, "machinename")), count.index)}"
  }
  connection {
    user        = "${element(split(",", lookup(var.machine, "machinename")), count.index)}"
    private_key = "${file("${lookup(var.keys, "privateKey")}")}"
  }
}

###############################
########## Template ###########
###############################

# Render a part using a `template_file`
data "template_file" "script" {
  count    = "${length(split(",", lookup(var.machine, "machinename")))}"
  template = "${file("${path.module}/cloudInit/cloudInit.tpl")}"
}


output "public_ips" {
  value = ["${aws_instance.frontal.*.public_ip}"]
}
