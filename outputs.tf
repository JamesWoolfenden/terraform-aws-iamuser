output "AWS_Secret_Access_Key" {
  value = aws_iam_access_key.terraform.encrypted_secret
}

output "AWS_Access_Key_ID" {
  value = aws_iam_access_key.terraform.id
}
