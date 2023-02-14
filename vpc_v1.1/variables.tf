variable "instance_type"{
    type = string
    description = " This is an intance type for EC2 Instance"
    default = "t2.micro"
}
variable "env"{
    type = string
    description = " This is an intance env for EC2 Instance"
    default = "dev"
}

variable "tags_ec2"{
    type = string
    description = " This is a tag name for EC2 Instance"
    default = "first_ec2"
}

# --- Security group ---

variable "tags_main_sg1"{
    type = string
    description = " This is a sg name"
    default = "security_group"
}

variable "ports"{
    type = list(string)
    description = " This is a list of ports"
    default = ["22", "80"]
}

variable "task-launch-config"{
    type = string
    description = " This is name for launch configuraton"
    default = "dev"
}

variable "windows-key"{
    type = string
    description = " This is my windows key"
    default = "windows-key"
}

variable "first_ec2" {
    type = string
    description = " This is my first_ec2 name"
    default = "ec2"
}


# --- VPC ---


variable "vpc_cider_block" {
    type = string
    description = "This cidr block for my_vpc"
    default = "10.0.0.0/16"
}

variable "ins_tenancy" {
    type = string
    description = "describy tenancy for instance type"
    default = "default"
}
variable "tags_vpc" {
    type = string
    description = "name tag for my_vpc"
    default = "my_vpc"
}


#   --- Create public subnets in three az ---

variable "public_subnet_a" {
    type = string
    description = "create public subnet in az - a"
    default = "us-west-2a"
}

variable "public_subnet_cidr_a" {
    type = string
    description = "specify codr block for the public subnet a"
    default = "10.0.1.0/24"
}
variable "tags_public_subnet_a" {
    type = string
    description = "name tag for public subnet a"
    default = "public_subnet_a"
}
 
variable "public_subnet_b" {
    type = string
    description = "create public subnet in az - b"
    default = "us-west-2b"
}

variable "public_subnet_cidr_b" {
    type = string
    description = "specify codr block in subnet b"
    default = "10.0.2.0/24"
}
variable "tags_public_subnet_b" {
    type = string
    description = "name tag for public subnet b"
    default = "public_subnet_b"
}

variable "public_subnet_c" {
    type = string
    description = "create public subnet in az - c"
    default = "us-west-2c"
}

variable "public_subnet_cidr_c" {
    type = string
    description = "specify codr block in subnet c"
    default = "10.0.3.0/24"
}
variable "tags_public_subnet_c" {
    type = string
    description = "name tag for public subnet c"
    default = "public_subnet_c"
}

# ---Create a public route table ---

variable "public_route_cidr_block" {
    type = string
    description = "specify all traffic for route table cidr block"
    default = "0.0.0.0/0"
}
variable "tags_public_route_table" {
    type = string
    description = "name tag for route table"
    default = "public_route_table"
}

#  ---- Create IntGateway and connect to the VPC --- 

variable "tags_int_gway" {
    type = string
    description = "this tag name for my_vpc internet gateway"
    default = "int_gway"
}

#    ----Allocate Elastic IP Address-----

variable "tags_eip" {
    type = string
    description = "this tag name for elastic ip"
    default = "eip"
}



#  ---- Create private subnets in three az ---


variable "private_subnet_a" {
    type = string
    description = "create private subnet in az - a"
    default = "us-west-2a"
}

variable "private_subnet_cidr_a" {
    type = string
    description = "specify codr block in subnet a private subet a"
    default = "10.0.10.0/24"
}
variable "tags_private_subnet_a" {
    type = string
    description = "name tag for public subnet a"
    default = "private_subnet_a"
}

variable "private_subnet_b" {
    type = string
    description = "create private subnet in az - b"
    default = "us-west-2b"
}

variable "private_subnet_cidr_b" {
    type = string
    description = "specify codr block in subnet a private subet b"
    default = "10.0.11.0/24"
}
variable "tags_private_subnet_b" {
    type = string
    description = "name tag for public subnet b"
    default = "private_subnet_b"
}
variable "private_subnet_c" {
    type = string
    description = "create private subnet in az - c"
    default = "us-west-2c"
}

variable "private_subnet_cidr_c" {
    type = string
    description = "specify codr block in subnet a private subet c"
    default = "10.0.12.0/24"
}
variable "tags_private_subnet_c" {
    type = string
    description = "name tag for public subnet c"
    default = "private_subnet_c"
}


# --- Create a private route table  ---

variable "private_route_cidr_block" {
    type = string
    description = "specify traffic for private route table cidr block"
    default = "0.0.0.0/0"
}
variable "tags_private_route_table" {
    type = string
    description = "specify all traffic for route table cidr block"
    default = "private_route_table"
}


#   --- Create NAT gateway ---

variable "nat_gway_connection" {
    type = string
    description = "connectivity_type"
    default = "public"
}

