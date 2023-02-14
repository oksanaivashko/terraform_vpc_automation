resource "aws_security_group" "main_sg1" {
  name        = "${var.env}-sg"
  description = format("%s-sg", var.env)
 vpc_id = aws_vpc.my_vpc.id
 tags = {
    Name     = var.tags_main_sg1
  }
}
resource "aws_security_group_rule" "ingress" {
  count = length( var.ports ) 
  type              = "ingress"
  to_port           = element( var.ports, count.index ) 
  protocol          = "tcp"
  from_port         = element( var.ports, count.index ) 
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.main_sg1.id
}
resource "aws_security_group_rule" "egress" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  security_group_id = aws_security_group.main_sg1.id
  cidr_blocks = ["0.0.0.0/0"]
}

