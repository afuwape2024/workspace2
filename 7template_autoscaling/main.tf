#create launch template
resource "aws_launch_template" "web_launch_template" {
  name_prefix   = "web-server-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.tier2_public_sg]
    subnet_id                   = var.public_subnet
  }

  user_data = filebase64("/Users/oluwagbenroafuwape/Desktop/projects/deleted_trying/7template_autoscaling/user_data.sh")
  
}

resource "aws_autoscaling_group" "web_asg" {
  vpc_zone_identifier = [var.public_subnet, var.public_subnet2]
  launch_template {
    id      = aws_launch_template.web_launch_template.id
    version = "$Latest"
  }
  min_size         = 1
  max_size         = 4
  desired_capacity = 1
}


resource "aws_autoscaling_group" "auto_scaling_group" {
  launch_template {
    id      = aws_launch_template.web_launch_template.id
    version = "$Latest"
  }

  vpc_zone_identifier = [var.public_subnet, var.public_subnet2]
  min_size             = 1
  max_size             = 3
  desired_capacity     = 1

  tag {
    key                 = "Name"
    value               = "example-instance"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "scale_out" {
  name                   = "scale-out"
  scaling_adjustment       = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown                = 300
  autoscaling_group_name = aws_autoscaling_group.auto_scaling_group.name
}

resource "aws_autoscaling_policy" "scale_in" {
  name                   = "scale-in"
  scaling_adjustment       = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown                = 300
  autoscaling_group_name = aws_autoscaling_group.auto_scaling_group.name
}
    
