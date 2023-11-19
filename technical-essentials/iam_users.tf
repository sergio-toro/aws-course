resource "aws_iam_user" "test_employee" {
  name          = "TestEmployee"
  path          = "/employees/"
  force_destroy = true

  tags = local.tags
}

// README: to decode and share the password run:
// terraform output employee_accounts | jq -r 'fromjson | .TestEmployee' | base64 --decode | keybase pgp decrypt
resource "aws_iam_user_login_profile" "employee" {
  user    = aws_iam_user.test_employee.name
  pgp_key = "keybase:${var.keybase_username}"

  password_reset_required = true
}

