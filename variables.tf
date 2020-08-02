variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map
}

variable "path" {
  type    = string
  default = "/"
}

variable "username" {
  default = "Terraform"
}

variable "policyname" {
  default = "Terraform"
}
