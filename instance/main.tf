#create web server ec2 
resource "aws_instance" "web_server" {
  count = 3
  ami     = var.ami
  instance_type = var.instance_type
  subnet_id = var.public_subnet
  vpc_security_group_ids = [var.tier2_public_sg]

  tags = {
    Name = "web_server"
  }

}