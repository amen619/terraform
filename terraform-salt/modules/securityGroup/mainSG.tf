resource "aws_security_group" "securityGroup" {
  name = "terraform_security_group"

  # Access to port 22 ssh
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Access to port 4505 and 4506
  ingress {
    from_port = 4505
    to_port = 4506
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
