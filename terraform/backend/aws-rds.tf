resource "aws_db_instance" "default" {
  # availability_zone    = "ap-southeast-2"
  allocated_storage    = 2
  engine               = "postgres"
  engine_version       = "11.10"
  major_engine_version = "11"         # DB option group
  instance_class       = "db.t3.micro"
  family               = "postgres11" # DB parameter group
  name                 = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  skip_final_snapshot  = true
  storage_encrypted     = false
}