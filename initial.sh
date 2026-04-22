#!/bin/bash

echo "Скачиваем gdown"
sudo apt update
sudo apt install pipx -y
pipx ensurepath
source ~/.bashrc
pipx install gdown
cd ..
mkdir vagrant
cd vagrant
echo "Скачиваем Vagrant"
gdown "https://drive.google.com/uc?id=1Mn9tie1i6gMq5U80QlSZ3yH71lOL_Iym" -O vagrant.zip
echo "Скачиваем unzip"
sudo apt install unzip -y
echo "Распаковываем Vagrant"
unzip vagrant.zip
echo "Распаковали Vagrant"
echo "Делаем Vagrant исполняемым"
sudo cp vagrant /usr/local/bin/
sudo chmod +x /usr/local/bin/vagrant
echo "Сделали Vagrant исполняемым, смотрим версию"
vagrant --version

echo "Отключаем модули KVM"
sudo modprobe -r kvm_intel kvm
echo "Отключили"
lsmod | grep kvm
