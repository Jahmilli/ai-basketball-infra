resource "aws_instance" "application_server" {
  ami             = var.ami_id # TODO: Bake our own AMI and use that
  instance_type   = "t2.micro"
  key_name        = var.key_pair_name
  user_data       = file("../../ec2/userdata.sh")
  security_groups = ["${aws_security_group.application_server_ec2_instance.name}"]

  tags = {
    Description = "Application server"
  }
}

output "app_ip_public_addr" {
  value       = "${aws_instance.application_server.public_ip}"
  description = "The private ip address of the application instance"
}

output "app_ip_private_addr" {
  value       = "${aws_instance.application_server.private_ip}"
  description = "The private ip address of the application instance"
}
