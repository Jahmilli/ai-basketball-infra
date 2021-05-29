resource "aws_db_instance" "application_database" {
  allocated_storage    = 10
  engine               = "postgres"
  engine_version       = "11.10"
  identifier           = "ai-basketball"
  instance_class       = "db.t3.micro"
  # Obviously we shouldnt be storing this stuff in plaintext here but for a test database it's okay for now...
  name                 = "mydb"
  username             = "postgres"
  password             = "password"
  skip_final_snapshot  = true
  storage_encrypted     = false
  vpc_security_group_ids = ["${aws_security_group.application_database.id}"]
}
