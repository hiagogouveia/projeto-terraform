resource "aws_security_group" "SG-ssh" {
  name = "SG-ssh"
  description = "Libera acesso de ssh tf"

#   vpc_id = aws_vpc.test_env.vpc-001706d1e717dd2e4

  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }

  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = [ "::/0" ]
    from_port   = 0
    to_port     = 0
    protocol    = -1
  }

  tags = {
    "Name" = "Libera SSH"
  }
}                             