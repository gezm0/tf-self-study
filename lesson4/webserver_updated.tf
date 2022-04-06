provider "aws" {
    region = "eu-central-1"
}

resource "aws_instance" "my_webserver" {
    ami = "amiimage"
    instance_type = "t2.nano"
    vpc_security_group_ids = [aws_security_group.my_webserver.id]
    
    user_data = templatefile("user_data.sh.tpl", {
      f_name = "Sergei",
      l_name = "Eremin",
      names = ["Vasya", "Kolya", "Petya", "John", "Donald", "Masha"]
    })

    tags = {
      "Name" = "WebServer build by Terraform"
      "Owner" = "Me"
    }
}

resource "aws_security_group" "my_webserver" {
  name = "Webserver Security Group"
  description = "My First Security Group"

  tags = {
      "Name" = "WebServer Security Group"
      "Owner" = "Me"
    }
  
  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 80
    protocol = "tcp"
    to_port = 80
  }

  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 443
    protocol = "tcp"
    to_port = 443
  }

  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    protocol = "-1"
    to_port = 0
  }
}
