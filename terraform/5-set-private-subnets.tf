resource "aws_subnet" "private-subnet1" {
  vpc_id            = aws_vpc.head-vpc.id
  cidr_block        = "10.0.12.0/24"
  availability_zone = "eu-west-1a"
  tags              = {
    Name = "private-subnet1"
  }
}

resource "aws_subnet" "private-subnet2" {
  vpc_id            = aws_vpc.head-vpc.id
  cidr_block        = "10.0.22.0/24"
  availability_zone = "eu-west-1b"
  tags              = {
    Name = "private-subnet2"
  }
}