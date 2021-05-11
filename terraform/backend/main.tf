terraform {
  backend "s3" {
    bucket = "ai-basketball-terraform-state"
    key    = "application_server"
    region = "ap-southeast-2"
  }
}

provider "aws" {
  region = "ap-southeast-2"
}
