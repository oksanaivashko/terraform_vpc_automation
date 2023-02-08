data "aws_launch_configuration" "linux" {
  name = "task-launch-config"
  image_id = "ami-06e85d4c3149db26a"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.lc_sg.id ]
  key_name = "windows-key"
}
