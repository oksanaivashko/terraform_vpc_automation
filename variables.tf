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

