resource "aws_instance" "first_ec2" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type
  #subnet_id     = aws_subnet.public_a.id
  #vpc_security_group_ids = ["aws_security_group.main_sg.id"]
  tags = {
    Name = "first_ec2"
  }
}
