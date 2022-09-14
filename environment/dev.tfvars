vpc_cidr               = "10.0.0.0/16"
public_cidrs           = ["10.0.1.0/24", "10.0.2.0/24"]
private_cidrs          = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
azs                    = ["ap-south-1a", "ap-south-1b"]
env                    = "dev"
sg_name                = "ssh_security_group"
sg_description         = "allow from local"
public_instance_count  = 1
private_instance_count = 2
public_instance_type   = "t2.micro"
private_instance_type  = "t2.micro"
key_name               = "mumbai"

########### lb values ##############
healthy_threshold   = 2
unhealthy_threshold = 5
target_name         = "public-tg"
target_port         = 80
//target_type         = "instance"
target_protocol = "HTTP"

####### asg values ##########
asg_name         = "onlineshop_asg"
asg_name_lc      = "onlineshop_asg_lc"
min_size         = 1
max_size         = 5
desired_capacity = 2
