resource "aws_instance" "instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.instance_key.id
  #availability_zone = var.AZ[""]
  vpc_security_group_ids = [aws_security_group.inst_SG.id]
  subnet_id = data.aws_subnet.subnet_id.id

  tags = {
  "Name" = var.instance_tag_name
  }

  depends_on = [ 

  aws_key_pair.instance_key

 ]
 
}
