output "public_ip_wp" {
  value = "${aws_instance.wp.public_ip}"
}
