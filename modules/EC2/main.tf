data "aws_ami" "ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "template_file" "init" {
  template = "${file("${path.module}/install_wordpress.sh")}"
  vars = {
    dbname = "${var.rds_name}"
    dbpass = "${var.rds_password}"
    dbhost = "${var.rds_hostname}"
    dbuname = "${var.rds_username}"
  }
}

resource "aws_key_pair" "terraform-demo" {
  key_name   = "terraform-demo"
  public_key = "${file("${path.module}/terraform-demo.pub")}"
}

resource "aws_instance" "my-instance" {
	ami = "${data.aws_ami.ami.id}"
	instance_type = "t2.nano"
	key_name = "${aws_key_pair.terraform-demo.key_name}"
	user_data = "${data.template_file.init.rendered}"
        vpc_security_group_ids  = ["${var.security-group}"]

	tags = {
		Name = "Terraform"
	}
}

