#!/bin/bash 
#Jitsi install

sudo apt update && apt full-upgrade -y
sudo apt install apt-transport-https gnupg2 nginx-full sudo openjdk-8-jdk -y
sudo apt-add-repository universe
sudo apt update
sudo hostnamectl set-hostname $(LINODE_ID)

curl https://download.jitsi.org/jitsi-key.gpg.key | sudo sh -c 'gpg --dearmor > /usr/share/keyrings/jitsi-keyring.gpg'
echo 'deb [signed-by=/usr/share/keyrings/jitsi-keyring.gpg] https://download.jitsi.org stable/' | sudo tee /etc/apt/sources.list.d/jitsi-stable.list > /dev/null

# update all package sources
sudo apt update

sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 10000/udp
sudo ufw allow 22/tcp
sudo ufw allow 3478/udp
sudo ufw allow 5349/tcp
sudo ufw enable -y

sudp apt install jitsi-meet
sudo /usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh
