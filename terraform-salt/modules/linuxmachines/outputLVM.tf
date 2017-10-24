output "public_ips" {
  value = ["${aws_instance.frontal.*.public_ip}"]
}

output "private_ips" {
  value = ["${aws_instance.frontal.*.private_ip}"]
}
