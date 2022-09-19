resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id

  ingress {
    description = var.ingress_description
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.protocol
    cidr_blocks = var.cidr_blocks
  }
#    ingress {
#    description = "TLS from VPC"
#    from_port   = var.from_port
#    to_port     = var.to_port
#    protocol    = var.protocol
#    cidr_blocks = var.cidr_blocks
#  }
  tags = {
    Name = "${var.env}-public-sg"
  }
}
