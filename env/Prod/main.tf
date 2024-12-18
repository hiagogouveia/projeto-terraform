module "aws-prod" {
  source = "../../infra"
  instance_type = "t2.micro"
  regiao_aws = "us-east-1"
  chave = "Iac-Prod"
  ami = "ami-0453ec754f44f9a4a"
}