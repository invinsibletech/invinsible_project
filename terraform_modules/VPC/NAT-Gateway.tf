# NAT Gatway for the private subnet

resource "aws_nat_gateway" "NAT" {
    allocation_id = aws_eip.eip.id
    subnet_id = aws_subnet.pub-subnet.id
    

    tags = {
      "Name" = var.Nat_gateway_name
    }
  
}