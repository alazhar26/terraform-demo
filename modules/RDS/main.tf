resource "aws_db_instance" "RDS" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "${var.rds_engine}"
  engine_version         = "${var.rds_engine_version}"
  instance_class         = "${var.rds_instance_class}"
  name                   = "${var.rds_name}"
  username               = "${var.rds_username}"
  password               = "${var.rds_password}"
  parameter_group_name   = "${var.parameter_group}"
  vpc_security_group_ids = ["${var.db_sg_ids}"]

  tags = {
    Name       = "demo"
    Creater    = "Terraform"
  }
}
