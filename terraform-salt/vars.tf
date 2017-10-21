variable "region" {
  default = "eu-west-1"
}

variable "machine" {
  default = {
    machinename = "master,ubuntu"
    template = "cloudInitMaster,cloudInitUbuntu"
  }
}

variable "keys" {
  default = {
    privateKey = "mykey"
    publicKey  = "mykey.pub"
  }
}
