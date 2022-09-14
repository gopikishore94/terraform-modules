variable "vpc_cidr" {}
variable "env" {}
variable "public_cidrs" {
  type = list(any)
}
variable "azs" {}
variable "private_cidrs" {
  type = list(any)
}
variable "vpc_id" {
  default = ""
}
variable "public_instance_count" {
  default = ""
}
variable "private_instance_count" {
  default = ""
}
variable "public_instance_type" {
  default = ""
}
variable "private_instance_type" {
  default = ""
}
variable "key_name" {
  default = ""
}
variable "public_subnet_id" {
  default = ""
}
variable "private_subnet_id" {
  default = ""
}
variable "vpc_security_group_ids" {
  default = ""
}
########## SG ###########
variable "sg_name" {
  default = ""
}
variable "sg_description" {
  default = ""
}
variable "public_from_port" {
  default = ""
}
variable "public_to_port" {
  default = ""
}
variable "public_protocol" {
  default = ""
}
variable "private_from_port" {
  default = ""
}
variable "private_to_port" {
  default = ""
}
variable "private_protocol" {
  default = ""
}
variable "cidr_blocks"{
  default = ""
}
############## lb vars ###############
variable "target_name" {}
variable "target_port" {}
variable "target_protocol" {}
variable "healthy_threshold" {}
variable "unhealthy_threshold" {}
########### asg vars #############
variable "asg_name_lc" {}
//variable "ami_id"{}
variable "asg_name" {}
variable "min_size" {}
variable "max_size" {}
variable "desired_capacity" {}
//variable"availability_zone"{}