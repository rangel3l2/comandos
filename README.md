# comandos
# Alterar as configurações do teclado
sudo vi /etc/default/keyboard  # Use o editor que você preferir
# ou
# sudo nano /etc/default/keyboard  # Use nano se preferir

# Edite a linha XKBLAYOUT para o layout desejado
sudo sed -i 's/XKBLAYOUT=".*"/XKBLAYOUT="br"/' /etc/default/keyboard

