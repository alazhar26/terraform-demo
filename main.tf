provider "aws" {
  region     = "${var.region}"
}

terraform {
  backend "s3" {
    bucket = "bucketfordemoterraform"
    key    = "bucketfordemoterraform/terraform_state"
    region = "us-east-1"
  }
}

module "RDS" {
  source = "modules/RDS"
  rds_username = "${var.rds_username}"
  rds_password = "${var.rds_password}"
  rds_name     = "${var.rds_name}"
}

module "EC2" {
  source = "modules/EC2"
  rds_username = "${var.rds_username}"
  rds_password = "${var.rds_password}"
  rds_name     = "${var.rds_name}"
  rds_hostname = "${module.RDS.db-hostname}"
  security-group = "${var.security-group}"
}


module "ELB" {
  source = "modules/ELB"
  instance-ids = "${module.EC2.instance-ids}"
  security-group = "${var.security-group}"
}

 
