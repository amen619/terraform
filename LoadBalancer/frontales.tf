resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "frontal" {
  count                  = "${length(var.frontales)}"
  ami                    = "${var.ami_ubuntu}"
  instance_type          = "${var.micro_instance}"
  vpc_security_group_ids = ["${aws_security_group.rule80.id}"]
  key_name               = "${aws_key_pair.mykey.key_name}"
  user_data              = "${file("apache.conf")}"

  tags {
    Name = "${element(var.frontales, count.index)}"
  }

  connection {
    user        = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}

output "public_ips" {
  value = ["${aws_instance.frontal.*.public_ip}"]
}
