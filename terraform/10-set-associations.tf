resource "aws_route_table_association" "pub-association-1" {
  subnet_id      = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.PublicRt.id
  depends_on     = [aws_subnet.public-subnet1, aws_route_table.PublicRt]
}

resource "aws_route_table_association" "pub-association-2" {
  subnet_id      = aws_subnet.public-subnet2.id
  route_table_id = aws_route_table.PublicRt.id
  depends_on     = [aws_subnet.public-subnet2, aws_route_table.PublicRt]

}

resource "aws_route_table_association" "private-association-1" {
  subnet_id      = aws_subnet.private-subnet1.id
  route_table_id = aws_route_table.PrivateRt-1.id
  depends_on     = [aws_subnet.private-subnet1, aws_route_table.PrivateRt-1]

}

resource "aws_route_table_association" "private-association-1" {
  subnet_id      = aws_subnet.private-subnet2.id
  route_table_id = aws_route_table.PrivateRt-2.id
  depends_on     = [aws_subnet.private-subnet2, aws_route_table.PrivateRt-2]
}
resource "aws_route_table_association" "database-association-1" {
  subnet_id      = aws_subnet.db-subnet1.id
  route_table_id = aws_route_table.DatabaseRt.id
  depends_on     = [aws_subnet.db-subnet1, aws_route_table.DatabaseRt]

}

resource "aws_route_table_association" "database-association-2" {
  subnet_id      = aws_subnet.db-subnet2.id
  route_table_id = aws_route_table.DatabaseRt.id
  depends_on     = [aws_subnet.db-subnet2, aws_route_table.DatabaseRt]

}