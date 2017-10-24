module "securityGroup" {
  source = "./modules/securityGroup"
}

module "machines" {
  source        = "./modules/linuxmachines"
  securityGroup = "${module.securityGroup.securityGroup}"
  keys          = "${var.keys}"
  machine       = "${var.machine}"
}
