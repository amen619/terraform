output "public_ips" {
  value = ["${aws_instance.frontal.*.public_ip}"]
}
