output "cloud_practitioner_ec2_ip" {
  value     = aws_instance.cloud_practitioner.public_ip
  sensitive = false
}
