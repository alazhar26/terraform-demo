output "elb-dns" {
  value = "${aws_elb.demo.dns_name}"
}
