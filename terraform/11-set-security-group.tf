resource "aws_security_group" "pub-sec-group" {
  vpc_id = aws_vpc.head-vpc.id
  name   = "pub-sec-group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/16"]
  }

  tags = {
    Name = "pub-sec-group"
  }
}

resource "aws_security_group" "private-sec-group" {
  vpc_id = aws_vpc.head-vpc.id
  name   = "private-sec-group"

  ingress {
    from_port   = 80
    protocol    = "TCP"
    to_port     = 80
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 80
    protocol    = "TCP"
    to_port     = 80
    cidr_blocks = ["10.0.0.0/16"]
  }

  tags = {
    Name = "private-sec-group"
  }
}

//Creating security group for database instance
resource "aws_security_group" "db-sec-group" {
  vpc_id = aws_vpc.head-vpc.id
  name   = "db-sec-group"

  ingress {
    from_port   = 3306
    protocol    = "TCP"
    to_port     = 3306
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 3306
    protocol    = "TCP"
    to_port     = 3306
    cidr_blocks = ["10.0.0.0/16"]
  }

  tags = {
    Name = "db-sec-group"
  }
}

resource "aws_security_group" "allow-ssh" {
  vpc_id      = aws_vpc.head-vpc.id
  name        = "allow-ssh"
  description = "security group that allows ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow-ssh"
  }
}