output "instance_ips" {
  value = ["${aws_instance.my-test-instance.*.public_ip}"]
}
