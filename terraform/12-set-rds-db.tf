resource "aws_db_subnet_group" "database-subnet-group" {
  name       = "database-subnet-group"
  subnet_ids = [aws_subnet.db-subnet1.id, aws_subnet.db-subnet2.id]

  tags = {
    Name = "database-subnet-group"
  }
}
//Use your own credentials
resource "aws_db_instance" "mysql" {
  identifier             = "mysql-project-app"
  allocated_storage      = 8
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  name                   = "UserDb"
  username               = ""
  password               = ""
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  db_subnet_group_name   = "database-subnet-group"
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.db-sec-group.id, aws_security_group.allow-ssh.id]
}