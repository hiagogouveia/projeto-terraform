data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = [ "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*" ]
  }
  owners = [ "099720109477" ]
}

module "aws-dev" {
  source        = "../../infra"
  instance_type = "t2.micro"
  regiao_aws    = "us-east-1"
  chave         = "Iac-Dev"
  # ami = data.aws_ami.ubuntu.id
  ami = module.aws-dev.ami_id
}

output "IP" {
  value = module.aws-dev.IP_publico
}