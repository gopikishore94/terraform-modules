resource "aws_instance" "public_ec2" {
  count                  = var.instance_count
  ami                    = data.aws_ami.app_ami.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = element(var.public_subnet_ip, count.index)
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = {
    Name = "${var.env}-public-${count.index + 1}"
  }
}

resource "aws_instance" "private_ec2" {
  count                  = var.instance_count
  ami                    = data.aws_ami.app_ami.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = element(var.private_subnet_ip, count.index)
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = {
    Name = "${var.env}-private-${count.index + 1}"
  }
}
