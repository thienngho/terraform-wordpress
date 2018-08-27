resource "aws_instance" "wp" {
  ami           = "${var.aws_ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${aws_subnet.public.id}"
  root_block_device {
    volume_type           = "gp2"
    volume_size           = 10
    delete_on_termination = true
  }
  vpc_security_group_ids = ["${aws_security_group.wp-sg.id}"]
  key_name = "${aws_key_pair.wp.id}"
  tags {
    Name = "${var.app_name}-${var.environment}"
    Environment = "${var.environment}"
  }
}
