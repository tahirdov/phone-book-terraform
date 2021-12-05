resource "aws_subnet" "public-subnet1" {
  vpc_id                  = aws_vpc.head-vpc.id
  cidr_block              = "10.0.11.0/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true
  tags                    = {
    Name = "public-subnet1"
  }
}

resource "aws_subnet" "public-subnet2" {
  vpc_id                  = aws_vpc.head-vpc.id
  cidr_block              = "10.0.21.0/24"
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = true
  tags                    = {
    Name = "public-subnet2"
  }
}



