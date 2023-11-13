output "public_subnet_id" {
    description = "Public subnet id"
    value = aws_subnet.pub-subnet.id
  
}

output "priv_subnet_id" {
    description = "Private subnet id"
    value = aws_subnet.priv-subnet.id
  
}