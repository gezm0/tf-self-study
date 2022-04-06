provider "aws" {
    region = "eu-central-1"
}

resource "aws_security_group" "my_webserver" {
  name = "Dynamic Security Group"

  tags = {
    "Name" = "Dynamic Security Group"
    "Project" = "Terraform Study"
    "Owner" = "Sergei Eremin"
  }

  dynamic "ingress" {
    for_each = [ "80", "443", "8080",  "1541", "9092" ]
    content {
      from_port = ingress.value
      to_port = ingress.value
      cidr_blocks = [ "0.0.0.0/0" ]
      protocol = "tcp"
    }
  }

  ingress {
    from_port = 22
    to_port = 22
    cidr_blocks = [ "10.10.0.0/16" ]
    protocol = "tcp"
  }

  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    protocol = "-1"
    to_port = 0
  }
}
