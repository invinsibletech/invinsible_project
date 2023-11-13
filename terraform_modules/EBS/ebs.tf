resource "aws_ebs_volume" "ebs" {
  availability_zone = var.AZ
  size =  local.size         # size of the drive in GiBs
  encrypted = false
  final_snapshot = false # If true, snapshot will be created before volume deletion.
  type = var.EBS_type[1]     # IF not specified the type will default to gp2



  tags = {
    "Name" = var.ebs_name
  }
  
}


resource "aws_volume_attachment" "ava" {
  instance_id = var.inst_id
  force_detach = true
  volume_id = var.vol_id
  device_name = var.Dev_name   
  stop_instance_before_detaching = true
}

resource "aws_ebs_snapshot" "aes" {
  volume_id = var.vol_id

  tags = {
    "Name" = "${var.ebs_name}-snap"
  }
}
