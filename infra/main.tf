terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.1.3"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = [ "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*" ]
  }
  owners = [ "099720109477" ]
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = var.chave
  security_groups = ["${aws_security_group.SG-ssh.id}"]
  # user_data = <<-EOF
  #               #!/bin/bash
  #           cd /home/
  #           echo "<h1>Feito com Terraform</h1>" > index.html
  #           nohup busybox httpd -f -p 8080 &
  #               EOF
  tags = {
    Name = "teste-terraform"
  }
}

resource "aws_key_pair" "chaveSSH" {
  key_name = var.chave
  public_key = file("${var.chave}.pub")
}

output "IP_publico" {
  value = aws_instance.app_server.public_ip
}

