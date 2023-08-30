#!/bin/bash
#instalation -> chmod +x nome-file.sh
               #run -> ./nome-file.sh
# Instalar NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Carregar o NVM nas variáveis de ambiente
source ~/.nvm/nvm.sh

# Instalar o Node.js LTS
nvm install --lts

# Instalar o Angular CLI globalmente
npm install -g @angular/cli

# Instalar o python3-dev e python3-venv
sudo apt-get update
sudo apt-get install git net-tools openssh-server
sudo apt-get install -y python3-dev python3-venv

# Baixar e instalar o Go (Golang)
wget https://go.dev/dl/go1.21.0.linux-armv6l.tar.gz
sudo tar -C /usr/local -xzf go1.21.0.linux-armv6l.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc

# Limpar arquivos de instalação
rm go1.21.0.linux-armv6l.tar.gz

# Instalar MongoDB
sudo adduser --ingroup nogroup --shell /etc/false --disabled-password --gecos "" --no-create-home mongodb
sudo mkdir /var/log/mongodb
sudo chown mongodb:nogroup /var/log/mongodb
sudo mkdir /var/lib/mongodb
sudo chown mongodb:root /var/lib/mongodb
sudo chmod 775 /var/lib/mongodb

# Clone o repositório MongoDB-OrangePI
git clone https://github.com/robertsLando/MongoDB-OrangePI.git

# Configuração do MongoDB
cd MongoDB-OrangePI
sudo cp mongodb.conf /etc
sudo cp mongodb.service /lib/systemd/system

cd bin
sudo chown root:root mongo*
sudo chmod 755 mongo*
sudo cp -p mongo* /usr/bin

# Iniciar e habilitar o serviço do MongoDB
sudo systemctl start mongodb
sudo systemctl status mongodb
sudo systemctl enable mongodb

# Recuperar o MongoDB, se necessário
if sudo -u mongodb mongod --repair --dbpath /var/lib/mongodb/; then
  sudo service mongodb restart
else
  echo "Não foi necessário executar a recuperação do MongoDB."
fi

echo "Todas as dependências e configurações foram realizadas com sucesso!"
