resource "aws_route_table" "PublicRt" {
  vpc_id = aws_vpc.head-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags = {
    Name = "PublicRt"
  }

}

resource "aws_route_table" "PrivateRt-1" {
  vpc_id = aws_vpc.head-vpc.id
  route {
    cidr_block     = "10.0.0.0/16"
    nat_gateway_id = aws_nat_gateway.pub-nat-gw1.id
  }
  tags   = {
    Name = "PrivateRt-1"
  }

  depends_on = [aws_nat_gateway.pub-nat-gw1]
}

resource "aws_route_table" "PrivateRt-2" {
  vpc_id = aws_vpc.head-vpc.id
  route {
    cidr_block     = "10.0.0.0/16"
    nat_gateway_id = aws_nat_gateway.pub-nat-gw2.id
  }
  tags   = {
    Name = "PrivateRt-2"
  }

  depends_on = [aws_nat_gateway.pub-nat-gw2]
}

resource "aws_route_table" "DatabaseRt" {
  vpc_id = aws_vpc.head-vpc.id

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }
  tags = {
    Name = "DatabaseRt"
  }
}