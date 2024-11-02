# variables.tf
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "instance_type" {
  default = "t2.micro"
}

# variable "key_name" {
#   description = "The name of the SSH key pair"
# }

variable "sns_email" {
  description = "Email for SNS notifications"
}
