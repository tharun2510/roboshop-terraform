terraform {
  backend "s3" {
    bucket = "roboshoptarun"
    key    = "roboshop/dev/terraform.tfstate"
    region = "us-east-1"
  }
}