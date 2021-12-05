resource "aws_vpc" "head-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "phonebook-vpc"
  }
}