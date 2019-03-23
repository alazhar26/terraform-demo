output "pulic_address" {
  value = "${aws_instance.my-instance.public_ip}"
}

output "instance-ids" {
  value = "${aws_instance.my-instance.id}"
}

