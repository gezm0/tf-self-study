provider "aws" {
    access_key = "aaaaaa"
    secret_key = "aaaaaaa"
    region = "eu-central-1"
}

resource "aws_instance" "my_Ubuntu" {
    ami = "amiimage"
    instance_type = "t2.nano"

    tags = {
      "Name" = "Instance Name"
      "Owner" = "My Name"
      "Project" = "Project Name"
    }
}