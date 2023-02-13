#Create VPC
resource "aws_vpc" "my_vpc" {       
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
   tags = {
        Name = "my_vpc"
    }
}



#   --- Create public subnets in three az ---


resource "aws_subnet" "public_a" {
    vpc_id = aws_vpc.my_vpc.id
  availability_zone = "us-west-2a"
  cidr_block       = "10.0.1.0/24"
  tags = {
        Name = "public_subnet_a"
  }
}
resource "aws_subnet" "public_b" {
    vpc_id = aws_vpc.my_vpc.id
  availability_zone = "us-west-2a"
  cidr_block       = "10.0.2.0/24"
  tags = {
        Name = "public_subnet_b"
  }
}
resource "aws_subnet" "public_c" {
    vpc_id = aws_vpc.my_vpc.id
  availability_zone = "us-west-2a"
  cidr_block       = "10.0.3.0/24"
  tags = {
        Name = "public_subnet_c"
  }
}


#   ---Create a public route table ---

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

 route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.int_gway.id
  }
}

#  ---Associate subnets to Public Route Table---

resource "aws_route_table_association" "public_route_table1" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_route_table2" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_route_table3" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public_route_table.id
}



#  ---- Create IntGateway and connect to the VPC ---   

resource "aws_internet_gateway" "int_gway" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "int_gway"
  }
}


#    ----Allocate Elastic IP Address------

resource "aws_eip" "nat_gateway_eip"{
    vpc = true
    tags = {
        Name = "eip"
    }
}


#  ---- Create private subnets in three az ---
resource "aws_subnet" "private_subnet_a" {
    vpc_id = aws_vpc.my_vpc.id
  availability_zone = "us-west-2a"
  cidr_block       = "10.0.11.0/24"
  tags = {
        Name = "private_subnet_a"
  }

}
resource "aws_subnet" "private_subnet_b" {
    vpc_id = aws_vpc.my_vpc.id
  availability_zone = "us-west-2a"
  cidr_block       = "10.0.12.0/24"
  tags = {
        Name = "private_subnet_b"
  }
}
resource "aws_subnet" "private_subnet_c" {
    vpc_id = aws_vpc.my_vpc.id
  availability_zone = "us-west-2a"
  cidr_block       = "10.0.13.0/24"
  tags = {
        Name = "private_subnet_c"
  }

}


#    --- Create a private route table  ---

resource "aws_route_table" "tasktest_private_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gway.id
  }
  tags = {
        Name = "private_route_table"
  }

}



#   ---Associate subnets to Private Route Table---

resource "aws_route_table_association" "private_a" {
  subnet_id = aws_subnet.private_subnet_a.id
  route_table_id = aws_route_table.tasktest_private_route_table.id
}

resource "aws_route_table_association" "private_b" {
  subnet_id = aws_subnet.private_subnet_b.id
  route_table_id = aws_route_table.tasktest_private_route_table.id
}

resource "aws_route_table_association" "private_c" {
  subnet_id = aws_subnet.private_subnet_c.id
  route_table_id = aws_route_table.tasktest_private_route_table.id
}


#   --- Create NAT gateway ---

resource "aws_nat_gateway" "nat_gway" {
  connectivity_type = "public"
  subnet_id         = aws_subnet.public_a.id
  allocation_id = aws_eip.nat_gateway_eip.id
}