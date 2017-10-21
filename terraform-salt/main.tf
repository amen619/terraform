module "securityGroup" {
  source = "./modules/securityGroup"
}

module "machines" {
  source        = "./modules/machines"
  securityGroup = "${module.securityGroup.securityGroup}"
  keys          = "${var.keys}"
  machine       = "${var.machine}"
}
