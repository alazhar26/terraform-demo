variable "rds_engine" {
  default = "mysql"
}

variable "rds_engine_version" {
  default = "5.7"
}

variable "rds_instance_class" {
  default = "db.t2.micro"
}

variable "rds_name" {
}

variable "rds_username" {
}

variable "rds_password" {
}

variable "parameter_group" {
  default = "default.mysql5.7"
}

variable "db_sg_ids" {
  default = "sg-01c5c0db117ab8c7a"
}
