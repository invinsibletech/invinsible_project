resource "aws_db_instance" "instance" {
  # Storage Autoscaling
  allocated_storage =  var.initial_storage        # This is in gibibytes
  max_allocated_storage =   var.max_storage    # This is in gibibytes

  allow_major_version_upgrade = false   # Note: The changes is asynchronously applied as soon as possible.
  apply_immediately = true     # This defaults to false

  

  backup_retention_period = var.instance.engine
  engine_version = data.aws_rds_orderable_db_instance.instance.engine_version
  identifier = var.identifier
  instance_class = data.aws_rds_orderable_db_instance.instance.instance_class
  kms_key_id = aws_kms_key.key.id
  multi_az = true
  storage_encrypted = true
  username = var.username
  password = var.password

  tags = {
    "Name" = var.db_instance_name
  }

}

resource "aws_db_subnet_group" "group" {
  name = var.group_name
  subnet_ids = var.subnet_id

  tags = {
    "Name" = var.group_name 
  }
}