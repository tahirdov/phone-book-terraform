//Creating elastic ip for subnet - A
resource "aws_eip" "elastic-ip1" {
  vpc = true
}
//Creating elastic ip for subnet - B
resource "aws_eip" "elastic-ip2" {
  vpc = true
}