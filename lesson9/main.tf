provider "aws" {
    region = "ca-central-1"
}

data "aws_ami" "latest_ami_ubuntu" {
    owners      = ["099720109477"]
    most_recent = true
    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
    }
}

output "latest_ami_ubuntu_id" {
    value = data.aws_ami.latest_ami_ubuntu.id
}

output "latest_ami_ubuntu_name" {
    value = data.aws_ami.latest_ami_ubuntu.name
}