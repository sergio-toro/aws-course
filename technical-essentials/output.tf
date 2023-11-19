output "technical_essentials_ec2_ip" {
  value     = aws_instance.technical_essentials.public_ip
  sensitive = false
}

// README: to decode and share the password run:
// terraform output employee_accounts | jq -r 'fromjson | .TestEmployee' | base64 --decode | keybase pgp decrypt
output "employee_accounts" {
  value = jsonencode({
    "${aws_iam_user.test_employee.name}" = aws_iam_user_login_profile.employee.encrypted_password
  })
}
