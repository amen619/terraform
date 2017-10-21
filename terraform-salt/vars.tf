variable "region" {
  default = "eu-west-1"
}

variable "machine" {
  default = {
    machinename = "master,ubuntu"
  }
}

variable "keys" {
  default = {
    privateKey = "mykey"
    publicKey  = "mykey.pub"
  }
}
