resource "aws_subnet" "db-subnet1" {
  vpc_id            = aws_vpc.head-vpc.id
  cidr_block        = "10.0.13.0/24"
  availability_zone = "eu-west-1a"
  tags              = {
    Name = "db-subnet1"
  }
}

//Database subnet for availability zone us-east-1b
resource "aws_subnet" "db-subnet2" {
  vpc_id            = aws_vpc.head-vpc.id
  cidr_block        = "10.0.23.0/24"
  availability_zone = "eu-west-1b"
  tags              = {
    Name = "db-subnet2"
  }
}