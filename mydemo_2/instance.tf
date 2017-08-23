resource "aws_instance" "example" {
  ami           = "ami-785db401"
  instance_type = "t2.micro"

  tags {
    Name = "terraform-example"
  }
}

output "public_ip" {
  value = "${aws_instance.example.public_ip}"
}
