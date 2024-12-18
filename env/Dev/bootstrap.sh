#!/bin/bash
# Atualiza os pacotes e instala python3 e virtualenv
set -e # para garantir que o script pare em caso de erro
echo "Iniciando script de inicialização" >> /tmp/bootstrap.log
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y python3 python3-virtualenv

# Cria o ambiente virtual e instala Django e Django Rest Framework

mkdir -p /home/ubuntu/tcc
echo "Diretório /home/ubuntu/tcc criado" >> /tmp/bootstrap.log
python3 -m venv /home/ubuntu/tcc/venv
source /home/ubuntu/tcc/venv/bin/activate
pip install django djangorestframework

# Verifica se o projeto já existe
if [ ! -f /home/ubuntu/tcc/setup/settings.py ]; then
  # Cria o projeto Django
  django-admin startproject setup /home/ubuntu/tcc/
fi

# Configura o ALLOWED_HOSTS no settings.py
sed -i 's/ALLOWED_HOSTS = .*/ALLOWED_HOSTS = ["*"]/' /home/ubuntu/tcc/setup/settings.py