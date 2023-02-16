variable "instance_type" {
  type        = string
  description = " This is an intance type for lc"
  default     = "t2.micro"
}
variable "env" {
  type        = string
  description = " This is an intance env for EC2 Instance"
  default     = "dev"
}

variable "task-launch-config" {
  type        = string
  description = " This is name for launch configuraton"
  default     = "dev"
}

variable "windows-key" {
  type        = string
  description = " This is my windows key"
  default     = "windows-key"
}

variable "first_ec2" {
  type        = string
  description = " This is my first_ec2 name"
  default     = "ec2"
}

variable "max_size" {
  type        = number
  description = "this is the max number of instances"
  default     = 5
}
variable "min_size" {
  type        = number
  description = "this is the minimum number of instances"
  default     = 2
}
variable "desired_capacity" {
  type        = number
  description = "this is the desired capacity"
  default     = 2
}
variable "force_delete" {
  type        = bool
  description = "this is the force delete option"
  default     = true
}
variable "vpc_zone_identifier" {
  type        = list(string) #it means it is a list
  description = "this is the list of the subnets to create the ec2 instances"
  default     = ["subnet-0459fee9e44c2ea55", "	subnet-06e6aa80daa0d03b3"]
}

