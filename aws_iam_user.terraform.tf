resource "aws_iam_user" "terraform" {
  # checkov:skip=CKV2_AWS_22: IAM user module — console access is managed separately via login profile
  # checkov:skip=CKV_AWS_273: IAM user module intended for programmatic access; SSO managed at org level
  name = var.username
  path = var.path

  tags = var.common_tags
}

resource "aws_iam_access_key" "terraform" {
  user    = aws_iam_user.terraform.name
  pgp_key = "keybase:jameswoolfenden"
}

resource "aws_iam_policy" "terraform" {
  # checkov:skip=CKV_AWS_290: IAM policy requires broad write access for this module to function
  # checkov:skip=CKV_AWS_355: IAM policy requires wildcard resource for this module to function
  name   = var.policyname
  policy = file("policy.json")
}

resource "aws_iam_user_policy_attachment" "attach" {
  #checkov:skip=CKV_AWS_40: "Ensure IAM policies are attached only to groups or roles (Reducing access management complexity may in-turn reduce opportunity for a principal to inadvertently receive or retain excessive privileges.)"
  user       = aws_iam_user.terraform.name
  policy_arn = aws_iam_policy.terraform.arn
}
