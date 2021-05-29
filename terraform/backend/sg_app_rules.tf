resource "aws_security_group_rule" "application_server_ec2_ingress_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"] # Update this to my IP range

  security_group_id = aws_security_group.application_server_ec2_instance.id
}

resource "aws_security_group_rule" "application_server_ec2_ingress_http" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.application_server_ec2_instance.id
}

resource "aws_security_group_rule" "application_server_ec2_ingress_https" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
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

# Database Rules
resource "aws_security_group_rule" "database_ingress_application_psql" {
  type        = "ingress"
  from_port   = 5432
  to_port     = 5432
  protocol    = "tcp"
  source_security_group_id = aws_security_group.application_server_ec2_instance.id

  security_group_id = aws_security_group.application_database.id
}
