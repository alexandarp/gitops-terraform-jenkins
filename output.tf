output "instance_ips" {
  value = ["${aws_instance.bastion-manager.*.public_ip}"]
}
