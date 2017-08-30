variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

variable "frontales" {
  description = "Number of frontales servers"
  type        = "list"
  default     = ["Frontal-1", "Frontal-2"]
}
