output "webserver_instance_id" {
  value = aws_instance.my_webserver.id
}

output "webserver_public_ip_address" {
  value = aws_eip.My_static_IP.public_ip
}

output "webserver_sg_id" {
  value = aws_security_group.my_webserver.id
}

output "webserver_sg_arn" {
  value = aws_security_group.my_webserver.arn
  description = "This is SecurityGroup ARN"
}