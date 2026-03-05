variable "tier2_vpc" {}
variable "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
}
variable "ami" {
  default = "ami-06e3c045d79fd65d9"
}
variable "instance_type" {
  default = "t3.micro"
}
variable "tier2_public_sg" {}

variable "public_subnet" {
  description = "Public subnet ID for EC2 instances"
}

variable "mandatory_tags" {
  description = "Mandatory tags to apply to resources"
  type        = map(string)
}