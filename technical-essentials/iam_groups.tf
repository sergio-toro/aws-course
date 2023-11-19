resource "aws_iam_group" "admin" {
  name = "Administrators"
}

resource "aws_iam_group_policy_attachment" "admin_attach" {
  group      = aws_iam_group.admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_membership" "admin_group_membership" {
  name = "admin_group_membership"

  users = [
    aws_iam_user.test_employee.name,
  ]

  group = aws_iam_group.admin.name
}
