resource "aws_security_group" "application_server_ec2_instance" {
  name        = "${terraform.workspace}-application_server-ec2"
  description = "Provide all the required rules to access the application_server EC2 instance"
  vpc_id      = data.aws_vpc.id.id
}
