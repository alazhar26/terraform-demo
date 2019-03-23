variable "rds_username" {
}

variable "rds_password" {
}

variable "rds_name" {
}

variable "security-group" {
  default = "sg-0ade422defbae0bbd"
}


variable "bucket" {
  default = "bucketfordemoterraform"
}

variable "bucket_key" {
  default = "bucketfordemoterraform/terraform_state"
}

variable "region" {
  default = "us-east-1"
}
