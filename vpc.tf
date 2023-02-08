#Create VPC
resource "aws_vpc" "tf_vpc" {       
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
}

#Create public subnets in three az
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

#Create IntGateway and connect to the VPC
resource "aws_internet_gateway" "int_gway" {
  vpc_id = aws_vpc.tf_vpc.id

  tags = {
    Name = "int_gway"
  }
}

#Create public route table and connect to IntGateway
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.tf_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.int_gway.id
  }
}

#Create private subnets in three az
resource "aws_subnet" "private_subnet_a" {
    vpc_id = aws_vpc.tf_vpc.id
  availability_zone = "us-west-2a"
  cidr_block       = "10.0.11.0/24"
}
resource "aws_subnet" "private_subnet_b" {
    vpc_id = aws_vpc.tf_vpc.id
  availability_zone = "us-west-2a"
  cidr_block       = "10.0.12.0/24"
}
resource "aws_subnet" "private_subnet_c" {
    vpc_id = aws_vpc.tf_vpc.id
  availability_zone = "us-west-2a"
  cidr_block       = "10.0.13.0/24"

}
#Create NatGateway with the public subnet and connect to private subnet
resource "aws_nat_gateway" "nat_gway" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.public_a.id

#Allocate Elastic IP Address
resource "aws_eip" "nat_gateway_eip"{
    vpc = true
    tags = {
        Name = "eip"
    }
}

}
#Create private route table and attach to VPC
resource "aws_route_table" "tasktest_private_route_table" {
  vpc_id = aws_vpc.tf_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gway.id
  }
}
