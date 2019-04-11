output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = ["${aws_instance.instance.*.public_ip}"]
}
output "private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = ["${aws_instance.instance.*.private_ip}"]
}

