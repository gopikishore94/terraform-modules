module "vpc" {
  source        = "../modules/vpc"
  vpc_cidr      = var.vpc_cidr
  env           = var.env
  public_cidrs  = var.public_cidrs
  private_cidrs = var.private_cidrs
  azs           = var.azs
}

module "security_group" {
  source         = "../modules/securitygroup"
  sg_name        = var.sg_name
  sg_description = var.sg_description
  vpc_id         = module.vpc.vpc_id
  env            = var.env
}

module "ec2" {
  source                 = "../modules/ec2"
  public_instance_count  = var.public_instance_count
  private_instance_count = var.private_instance_count
  public_instance_type   = var.public_instance_type
  private_instance_type  = var.private_instance_type
  key_name               = var.key_name
  public_subnet_id       = module.vpc.public_subnets
  private_subnet_id      = module.vpc.private_subnets
  vpc_security_group_ids = [module.security_group.security_id]
  env                    = var.env
  ami                    = data.aws_ami.app_ami.id
}

module "clb" {
  source              = "../modules/lb"
  healthy_threshold   = var.healthy_threshold
  unhealthy_threshold = var.unhealthy_threshold
  vpc_id              = module.vpc.vpc_id
  target_name         = var.target_name
  target_port         = var.target_port
  health_path         = "/"
  health_port         = 80
  target_protocol     = var.target_protocol
  target_id           = module.ec2.private_instance_ids
  subnets = [
    module.vpc.public_subnets[0],
    module.vpc.public_subnets[1]
  ]
  security_groups = [module.security_group.security_id]
}
module "auto_scaling" {
  source           = "../modules/autoscaling"
  depends_on       = [module.ec2.private_instance_ids]
  ami_id           = data.aws_ami.app_ami.id
  asg_name         = var.asg_name
  asg_name_lc      = var.asg_name_lc
  max_size         = var.max_size
  min_size         = var.min_size
  desired_capacity = var.desired_capacity
  security_groups  = [module.security_group.security_id]
  vpc_zone_identifier = [
    module.vpc.private_subnets[0],
    module.vpc.private_subnets[1]
  ]
  key_name = var.key_name
  //load_balancers = [module.clb.load_balancer_dns]
  env = var.env
}

