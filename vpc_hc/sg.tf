resource "aws_security_group" "lc_sg" {
  name        = "lc_sg"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.task_vpc.id

  ingress {
    description = "Allow SSH from VPC"
    from_port   = 22            #That the port from to port it's means only one port open
    to_port     = 22            #(if we open from port 20 to 22 it will open two ports)
    protocol    = "tcp"         #ssh uses tcp 
    cidr_blocks = ["0.0.0.0/0"] #Defines CIDR block
  }

  egress {
    from_port   = 0 #port expects number only 
    to_port     = 0
    protocol    = "-1"          #expect a string, came from AWS not Terraform (-1 means all ports open)
    cidr_blocks = ["0.0.0.0/0"] #[] list of CIDR block  
  }
}