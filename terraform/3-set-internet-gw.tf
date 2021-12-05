resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.head-vpc.id

  tags = {
    Name = "internet-gateway"
  }
}