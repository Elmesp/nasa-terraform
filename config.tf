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

  # provisioner "remote-exec" {
  #   connection {
  #     type        = "ssh"
  #     agent       = false
  #     user        = "ubuntu"
  #     private_key = "${file("~/.ssh/authorized_keys")}"
  #   }

  #   inline = [
  #     "sudo apt-get -y update",
  #     "sudo apt-get -y install nginx",
  #     "sudo service nginx start",
  #   ]
  # }

  # provisioner "file" {
  #   source      = "nodeapp.conf"
  #   destination = "/etc/nginx/conf.d/nodeapp.conf"
  # }
}

resource "aws_key_pair" "terraform" {
  key_name = "terraform"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfMCqXraSPxvhL2LIGluGC7Y8UsV1PuMcH1L3u7zdHnMQl0CzAt+1yjqdcbu/OVDBMtoPfimTp5BxawuodDdEEewNSOonL517oSQqwdaunkoy6bioITMvj6iiG4ab3thy0BaT0MWb7Thbf8KDHPIxLm0fdgJHSOhXRb6TEToNCi+zm9BVYcKiYK6HBfnh4wp9CI2pyhZ1OEhly/8K+SjQzg4j8TR/5EH7JEiCl64Y5gXwNxLDyjHHiGMqk2sv6EfxRncroAYVhonG/N63Fkd1BTOIWLNovgId/ehw/+ejh2LHi5Y7+whgPzVqaFfzmhXW/RSRMaAmxeAoLZWDUpeGx elmsep@elmsep.local"
}
