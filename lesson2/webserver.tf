provider "aws" {
    region = "eu-central-1"
}

resource "aws_instance" "my_webserver" {
    ami = "amiimage"
    instance_type = "t2.nano"
    vpc_security_group_ids = [aws_security_group.my_webserver.id]
    user_data = <<EOF
#!/bin/bash
yum -y update
yum -y install httpd
myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`    
echo "<h2>WebServer with IP: $myip</h2><br>Build by Terraform!" > /var/www/html/index.html
sudo service httpd start
chkconfig httpd on
EOF
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

/*
  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 443
    protocol = "tcp"
    to_port = 443
  }
*/

  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    protocol = "-1"
    to_port = 0
  }
}
