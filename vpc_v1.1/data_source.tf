#Fetch AIM from Data source block
data "aws_ami" "amazon_linux_2" {
  most_recent = true       #updated patch
  owners      = ["amazon"] #owner ami

  #Filter - optionsl, we use filter to narrow the filter down

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.*"] #ami source
  }

  filter {
    name   = "architecture"
    values = ["x86_64"] #ami source
  }
}