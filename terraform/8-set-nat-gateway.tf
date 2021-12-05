
resource "aws_nat_gateway" "pub-nat-gw1" {
  allocation_id = aws_eip.elastic-ip1.id
  subnet_id     = aws_subnet.public-subnet1.id
  depends_on    = [aws_internet_gateway.internet-gateway]

  tags = {
    Name = "pub-nat-gw1"
  }
}

resource "aws_nat_gateway" "pub-nat-gw2" {
  allocation_id = aws_eip.elastic-ip2.id
  subnet_id     = aws_subnet.public-subnet2.id
  depends_on    = [aws_internet_gateway.internet-gateway]
  tags          = {
    Name = "pub-nat-gw2"
  }
}
