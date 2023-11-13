data "aws_rds_orderable_db_instance" "instance" {
  engine = var.engine
  engine_version = var.engine_version
  license_model = var.license_model[0]
  storage_type = var.storage_type

  preferred_instance_classes = ["db.t2.small", "db.t3.medium", "db.t3.large"]
}