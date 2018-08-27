resource "aws_key_pair" "wp" {
  key_name   = "${var.app_name}-${var.environment}"
  public_key = "${var.ssh_key}"
}
