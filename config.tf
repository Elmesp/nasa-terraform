provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "nasa_nginx" {
  ami           = "ami-0ac019f4fcb7cb7e6"
  instance_type = "t2.micro"
  key_name = "terraform"
  associate_public_ip_address = true

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "ubuntu"
      private_key = "${file("/jenkins/terraform.pem")}"
      agent = false
    }

    inline = [
      "sudo apt-get -y update",
      "sudo apt-get -y install nginx",
      "sudo service nginx start",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }

  provisioner "file" {
    connection {
      type     = "ssh"
      user     = "ubuntu"
      private_key = "${file("/jenkins/terraform.pem")}"
      agent = false
    }

    source      = "nodeapp.conf"
    destination = "/etc/nginx/conf.d/nodeapp.conf"
  }
}
