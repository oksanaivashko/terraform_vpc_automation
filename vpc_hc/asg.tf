# Steps to Create auto scaling group GUI
# 
# Name tag 
# 
# Launch template > switch to launch configuration  
# 
# Choose from drop down menu 
# 
# Choose the VPC that defines the virtual network for your Auto Scaling group-aws-homework 
# 
# Availability Zones and subnets- choose all private subnets 
# 
# No load balancer  
# 
# Health checks - 60 seconds  
# 
# Enable group metrics collection within CloudWatch (ec2)
# 
# Desire capacity - how many you need to have all the time (desire is the same minimum) 
# 
# Maximum capacity – max make it triple  
# 
# Scaling policies - none (avoid using target tracking scaling policy) 
# 
# Instance scale-in protection – don't enable 
# 
# No notification 



resource "aws_autoscaling_group" "main" {
  name                      = "${var.env}-main-asg"
  max_size                  = var.max_size
  min_size                  = var.min_size
  health_check_grace_period = 60
  health_check_type         = "EC2"
  desired_capacity          = var.desired_capacity
  force_delete              = var.force_delete
  launch_configuration      = aws_launch_configuration.linux.name
  vpc_zone_identifier       = var.vpc_zone_identifier
  lifecycle {
    create_before_destroy = true
  }
  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
  }
}