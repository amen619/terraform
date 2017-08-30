resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "frontal" {
  count         = "${length(var.frontales)}"
  ami           = "ami-785db401"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.mykey.key_name}"

  tags {
    Name = "${element(var.frontales, count.index)}"
  }

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
    ]
  }

  connection {
    user        = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}

output "public_ips" {
  value = ["${aws_instance.frontal.*.public_ip}"]
}
