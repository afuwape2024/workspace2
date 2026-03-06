output "public_rt" {
  value = aws_route_table.public_rt.id
}
 
output "private_rt" {
  value = aws_route_table.private_rt.id
}

output "nat_gw" {
  value = aws_nat_gateway.nat_gw.id
}

output "nat_gateways_ready" {
  value = null_resource.delay_nat_gateway.id
}