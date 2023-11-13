resource "aws_efs_file_system" "efs" {
  creation_token = var.token
  throughput_mode = "elastic"
  encrypted = true

  

  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"

  }

  tags = {
    Name = var.efs_name
  }
}


resource "aws_efs_mount_target" "efs_mt" {
    for_each = var.subnet_id
    file_system_id = aws_efs_file_system.efs.id
    subnet_id = each.value
 /*  security_groups = aws_security_group.inst_SG.id


    depends_on = [ aws_security_group.inst_SG  ]
    */
}