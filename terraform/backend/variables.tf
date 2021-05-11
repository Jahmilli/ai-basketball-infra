variable "vpc_id" {
  type    = string
  default = "vpc-ceef27a9"
}

variable "subnet_a" {
  type    = string
  default = "subnet-fc987ca4"
}

variable "subnet_b" {
  type    = string
  default = "subnet-ca048983"
}

variable "subnet_c" {
  type    = string
  default = "subnet-81cc5fe6"
}

variable "key_pair_name" {
  type    = string
  default = "ai-basketball-ssh"
}

variable "ami_id" {
  type    = string
  default = "ami-0186908e2fdeea8f3"
}
