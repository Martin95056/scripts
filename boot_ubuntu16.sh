#!/bin/bash

GREEN='\033[1;32m'
CYAN='\033[1;36m'
NC='\033[0m'

echo "${GREEN}Installing pip...${NC}"
sudo apt-get install python-pip

pip install --upgrade pip

echo "${GREEN}Installing virtualenv...${NC}"
pip install virtualenv
mkdir ~/.virtualenvs

echo "${GREEN}Installing missing libs for psycopg2 and Pillow... (You'll be grateful once you try to install Django requirements)${NC}"
sudo apt install libpq-dev python3-dev
sudo apt-get install python-dev
sudo apt-get install libjpeg8-dev
sudo ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so /usr/lib

echo "${GREEN}Installing git...${NC}"
sudo apt-get install git-all

echo "${CYAN}Do you want to install Google Chrome? (yes/no): ${NC}"
read want_chrome
if [ $want_chrome = "yes" ]
then
    echo "${GREEN}Installing Google Chrome...${NC}"
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
    sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
    sudo apt-get update 
    sudo apt-get install google-chrome-stable
fi

echo "${GREEN}Inatalling j...${NC}"
wget https://github.com/gsamokovarov/jump/releases/download/v0.8.0/jump_0.8.0_amd64.deb
sudo dpkg -i jump_0.8.0_amd64.deb

echo "${CYAN}Do you want to install ZSH? (yes/no): ${NC}"
read want_zsh
if [ $want_zsh = "yes" ]
then
    echo "${GREEN}Installing ZSH...${NC}"
    sudo apt-get install zsh
    echo "${GREEN}Make ZSH default terminal >>> You need to login again to set the changes.${NC}"
    chsh -s $(which zsh)
    echo "${GREEN}Installing Oh-My-Zsh...${NC}"
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi

echo "${CYAN}Do you want to install SublimeText3? (yes/no): ${NC}"
read want_sublime
if [ $want_sublime = "yes" ]
then
    echo "${GREEN}Installing SublimeText3...${NC}"
    sudo add-apt-repository ppa:webupd8team/sublime-text-3
    sudo apt-get update
    sudo apt-get install sublime-text-installer
fi