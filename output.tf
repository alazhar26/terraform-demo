output "rds-address" {
  value = "${module.RDS.db-hostname}"
}

output "elb-dns" {
  value = "${module.ELB.elb-dns}"
}

