resource "aws_vpc" "tf_vpc" {       
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
}

resource "aws_subnet" "public_a" {
    vpc_id = aws_vpc.tf_vpc.id
  availability_zone = "us-west-2a"
  cidr_block       = "10.0.1.0/24"
}
resource "aws_subnet" "public_b" {
    vpc_id = aws_vpc.tf_vpc.id
  availability_zone = "us-west-2a"
  cidr_block       = "10.0.2.0/24"
}
resource "aws_subnet" "public_c" {
    vpc_id = aws_vpc.tf_vpc.id
  availability_zone = "us-west-2a"
  cidr_block       = "10.0.3.0/24"
}
resource "aws_internet_gateway" "int_gway" {
  vpc_id = aws_vpc.tf_vpc.id

  tags = {
    Name = "int_gway"
  }
}
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.tf_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.int_gway.id
  }
}

