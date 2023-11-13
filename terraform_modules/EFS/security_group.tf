# Security groups
/*
resource "aws_security_group" "inst_SG" {
  name = var.SG_name
  description = "allow access within this vpc"
  vpc_id = var.vpc_id
  
  # Inbound Rules
  dynamic "ingress" {
    for_each = var.ingressrules
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "TCP"
      cidr_blocks = [ "0.0.0.0/0" ]
    }
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    name = var.SG_name
  }

}

*/