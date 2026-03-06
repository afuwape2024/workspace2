#create the security group for tier2 public subnet servers
resource "aws_security_group" "tier2_public_sg" {
  name        = "tier2_sg"
  description = "Security group for tier2 public subnet servers"
  vpc_id      = var.tier2_vpc
  tags = {
    Name = "tier2_public_sg"
  }
}

# Ingress rule for HTTP (http port 80) from anywhere on the internet
resource "aws_vpc_security_group_ingress_rule" "http_access" {
  security_group_id = aws_security_group.tier2_public_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  description       = "Allow HTTP from the internet"
}
# Ingress rule for HTTPS (https 443) from outside the VPC CIDR
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.tier2_public_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}
# Ingress rule for SSH (TCP port 22) from a specific CIDR block
resource "aws_vpc_security_group_ingress_rule" "ssh_access" {
  security_group_id = aws_security_group.tier2_public_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  description       = "Allow SSH from specific IP range"
}

resource "aws_vpc_security_group_ingress_rule" "tcp_access" {
  security_group_id = aws_security_group.tier2_public_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 8080
  to_port           = 8080
  ip_protocol       = "tcp"
  description       = "Allow SSH from specific IP range"
}

# egress rule to allow all outbound traffic
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.tier2_public_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1"
  description       = "Allow all outbound traffic"
}


#$=========================================================================
#create the security group for tier2 private subnet servers
resource "aws_security_group" "tier2_private_sg" {
  name        = "tier2_private_sg"
  description = "Security group for tier2 private subnet servers"
  vpc_id      = var.tier2_vpc
  tags = {
    Name = "tier2_private_sg"
  }
}   

resource "aws_vpc_security_group_ingress_rule" "ssh_access_private" {
  security_group_id = aws_security_group.tier2_private_sg.id
  cidr_ipv4         = var.vpc_cidr_block
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  description       = "Allow SSH from specific IP range"
}

# # Ingress rule for HTTPS (TCP port 443) from within the VPC CIDR
# resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
#   security_group_id = aws_security_group.tier2_private_sg.id
#   cidr_ipv4         = aws_vpc.tier2_vpc.cidr_block
#   from_port         = 443
#   ip_protocol       = "tcp"
#   to_port           = 443
# }