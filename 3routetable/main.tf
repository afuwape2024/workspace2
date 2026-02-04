#both route table and route table association in one file#
#Also include the 2 NAT gateway route table and association here


#Please note that for each public subnet there should be a NAT gateway created and its id used in the private route table
#One section one public, nat gateway, private route table and association

resource "aws_route_table" "public_rt" {
  vpc_id = var.tier2_vpc

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.ig_tier2
  }
  tags = {
    Name = "public_rt"
  }
}
resource "aws_route_table_association" "public_rt_association" {
  subnet_id      = var.public_subnet
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rt_association2" {
  subnet_id      = var.public_subnet2
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"
}   

resource "aws_nat_gateway" "nat_gw" {
  depends_on = [ aws_eip.nat_eip ]
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = var.public_subnet
}

#private route table and association
resource "aws_route_table" "private_rt" {
  vpc_id = var.tier2_vpc
  depends_on = [ aws_eip.nat_eip ] #ensure EIP is created before NAT gateway

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "private_rt"
  }
}

resource "aws_route_table_association" "private_rt_association" {
  depends_on = [ aws_nat_gateway.nat_gw ]
  subnet_id      = var.private_subnet
  route_table_id = aws_route_table.private_rt.id
}
resource "aws_route_table_association" "private_rt_association2" {
  depends_on = [ aws_nat_gateway.nat_gw ]
  subnet_id      = var.private_subnet2
  route_table_id = aws_route_table.private_rt.id
}

#wait for nat gateway to be available
resource "null_resource" "delay_nat_gateway" {
  depends_on = [ aws_nat_gateway.nat_gw ]
  provisioner "local-exec" {
    command = "sleep 60"
  }
}
