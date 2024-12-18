module "aws-dev" {
  source = "../../infra"
  instance_type = "t2.micro"
  regiao_aws = "us-east-1"
  chave = "Iac-Dev"
  ami = "ami-0453ec754f44f9a4a"
}

output "IP" {
  value = module.aws-dev.IP_publico
}