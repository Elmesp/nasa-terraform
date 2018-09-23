variable "region" {
  default = "us-east-1"
}

provider "aws" {
  access_key = "AKIAJT45VR75DFUHR2VA"
  secret_key = "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"
  region     = "${var.region}"
}

resource "aws_instance" "nasa_nginx" {
  ami           = "ami-0ac019f4fcb7cb7e6"
  instance_type = "t2.micro"
}
