variable "region" {
  default = "us-east-1"
}

provider "aws" {
  access_key = "AKIAITBF2BAKIECD577A"
  secret_key = "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"
  region     = "${var.region}"
}

resource "aws_instance" "nasa_nginx" {
  ami           = "ami-0ac019f4fcb7cb7e6"
  instance_type = "t2.micro"
}
