variable "region" {
  default = "eu-west-1"
}

variable "frontales" {
  description = "Number of frontales servers"
  type        = "list"
  default     = ["Frontal-1", "Frontal-2"]
}

variable "ami_ubuntu" {
  default = "ami-785db401"
}

variable "micro_instance" {
  default = "t2.micro"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
