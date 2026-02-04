resource "aws_internet_gateway" "ig_tier2" {
  vpc_id = var.tier2_vpc
  tags = { "Name" = "ig-tier2" }
}