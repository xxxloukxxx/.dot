#!/bin/sh

###################

echo '### Update system'
sudo apt-get -qq update
sudo apt-get -y -qq full-upgrade
sudo apt-get -y -qq install sudo build-essential software-properties-common apt-transport-https aptitude curl psmisc locales-all micro vim p7zip-full unzip git openssh-client openssh-server suckless-tools stterm fish tmux xterm fonts-hack fonts-hack-otf fonts-hack-ttf fonts-hack-web fonts-font-awesome x11-utils libreadline-dev libx11-dev libxinerama-dev libxft-dev i3 i3blocks rsstail greetd xorg numlockx xrdp fzf fd-find bat nnn xdg-utils dex tree ripgrep feh btop adwaita-icon-theme > /dev/null
sudo apt-get -y autoremove > /dev/null

###################

echo '### Change shell to fish'
chsh -s /usr/bin/fish

###################

echo '### cp dotfiles'
cp -fr .config ~/
cp -fr .vimrc ~/
cp -fr .Xresources ~/

###################

echo '### Sudo no passwd'
sudo sh -c 'echo cedric ALL=\(ALL:ALL\) NOPASSWD:ALL > /etc/sudoers.d/moi'

###################

echo '### Install st & dmenu'
cd src
cd st
sudo make clean install > /dev/null
make clean > /dev/null
cd ..
cd dmenu
sudo make clean install > /dev/null
make clean > /dev/null
cd ..
cd ..

###################

echo '### Reconfigure locales'
sudo dpkg-reconfigure locales
