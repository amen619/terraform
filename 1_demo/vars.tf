variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-cd0f5cb6"
    us-west-2 = "ami-6e1a0117"
    eu-west-1 = "ami-785db401"
  }
}
