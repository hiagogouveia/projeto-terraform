terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.1.3"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0453ec754f44f9a4a"
  instance_type = "t2.micro"
  key_name = "key-pair-hexa-burguer"
  user_data = <<-EOF
                #!/bin/bash
            cd /home/
            echo "<h1>Feito com Terraform</h1>" > index.html
            nohup busybox httpd -f -p 8080 &
                EOF
  tags = {
    Name = "teste-terraform"
  }
}

