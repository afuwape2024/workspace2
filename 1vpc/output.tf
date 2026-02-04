output "tier2_vpc" {
  value = aws_vpc.tier2_vpc.id
}
output "public_subnet1" {
  value = aws_subnet.public_subnet.id
}
output "private_subnet1" {
  value = aws_subnet.private_subnet.id
}

#==========================================================
output "public_subnet2" {
  value = aws_subnet.public_subnet2.id
}
output "private_subnet2" {
  value = aws_subnet.private_subnet2.id
}

