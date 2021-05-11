resource "aws_security_group_rule" "application_server_ec2_ingress_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"] # Update this to my IP range

  security_group_id = aws_security_group.application_server_ec2_instance.id
}

resource "aws_security_group_rule" "application_server_ec2_ingress_connection" {
  type        = "ingress"
  from_port   = 25565
  to_port     = 25565
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.application_server_ec2_instance.id
}

resource "aws_security_group_rule" "application_server_ec2_egress_all" {
  type        = "egress"
  from_port   = 0
  to_port     = 65535
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.application_server_ec2_instance.id
}
