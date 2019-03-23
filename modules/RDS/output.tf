output "db-hostname" {
  value = "${aws_db_instance.RDS.address}"
}

