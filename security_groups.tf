resource "aws_security_group" "allow_tls" {
  name        = "allow_all"          #can put any name we want
  description = "Allow ALL inbound traffic" 
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Inbound traffic"       #Note:I can modify the Ingress and Egress rules to specify what traffic I want to let in and out
    from_port   = var.from_port_def
    to_port     = var.to_port_def
    protocol    = var.all_protocols
    cidr_blocks = var.sg_cidrs
  }

  egress {
    description = "Outboud traffic"
    from_port   = var.from_port_def
    to_port     = var.to_port_def
    protocol    = var.all_protocols
    cidr_blocks = var.sg_cidrs
  }

  tags = {
    Name = "allow_all"
  }
}
