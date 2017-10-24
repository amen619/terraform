output "machinesPublicIPs" {
  value = "${module.machines.public_ips}"
}

output "machinesPrivateIPs" {
  value = "${module.machines.private_ips}"
}
