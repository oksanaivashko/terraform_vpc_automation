#Create VPC
resource "aws_vpc" "my_vpc" {       
  cidr_block       = var.vpc_cider_block
  instance_tenancy = var.ins_tenancy
   tags = {
        Name = var.tags_vpc
    }
}



#   --- Create public subnets in three az ---


resource "aws_subnet" "public_subnet_a" {
    vpc_id = aws_vpc.my_vpc.id
  availability_zone = var.public_subnet_a
  cidr_block       = var.public_subnet_cidr_a
  tags = {
        Name = var.tags_public_subnet_a
  }
}
resource "aws_subnet" "public_subnet_b" {
    vpc_id = aws_vpc.my_vpc.id
  availability_zone = var.public_subnet_b
  cidr_block       = var.public_subnet_cidr_b
  tags = {
        Name = var.tags_public_subnet_b
  }
}
resource "aws_subnet" "public_subnet_c" {
    vpc_id = aws_vpc.my_vpc.id
  availability_zone = var.public_subnet_b
  cidr_block       = var.public_subnet_cidr_c
  tags = {
        Name = var.tags_public_subnet_c
  }
}


#   ---Create a public route table ---

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

 route {
    cidr_block = var.public_route_cidr_block
    gateway_id = aws_internet_gateway.int_gway.id
  }
}

#  ---Associate subnets to Public Route Table---

resource "aws_route_table_association" "public_route_table1" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_route_table2" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_route_table3" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public_route_table.id
}



#  ---- Create IntGateway and connect to the VPC ---   

resource "aws_internet_gateway" "int_gway" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = var.tags_int_gway
  }
}


#    ----Allocate Elastic IP Address------

resource "aws_eip" "nat_gateway_eip"{
    vpc = true
    tags = {
        Name = var.tags_eip
    }
}


#  ---- Create private subnets in three az ---

resource "aws_subnet" "private_subnet_a" {
    vpc_id = aws_vpc.my_vpc.id
  availability_zone = var.private_subnet_a
  cidr_block       = var.private_subnet_cidr_a
  tags = {
        Name = var.tags_private_subnet_a
  }

}
resource "aws_subnet" "private_subnet_b" {
    vpc_id = aws_vpc.my_vpc.id
  availability_zone = var.private_subnet_b
  cidr_block       = var.private_subnet_cidr_b
  tags = {
        Name = var.tags_private_subnet_b
  }
}
resource "aws_subnet" "private_subnet_c" {
    vpc_id = aws_vpc.my_vpc.id
  availability_zone = var.private_subnet_c
  cidr_block       = var.private_subnet_cidr_c
  tags = {
        Name = var.tags_private_subnet_c
  }
}


#    --- Create a private route table  ---

resource "aws_route_table" "tasktest_private_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = var.private_route_cidr_block
    nat_gateway_id = aws_nat_gateway.nat_gway.id
  }
  tags = {
        Name = var.tags_private_route_table
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
  connectivity_type = var.nat_gway_connection
  subnet_id         = aws_subnet.public_subnet_a.id
  allocation_id = aws_eip.nat_gateway_eip.id
}