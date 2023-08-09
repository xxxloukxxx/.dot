#!/bin/bash

###################
echo '### Reconfigure locales'
sudo localectl set-locale fr_FR.UTF-8

###################
echo '### Update system'
sudo apt-get -qq update
sudo apt-get -y -qq full-upgrade
sudo apt-get -y -qq install build-essential software-properties-common apt-transport-https aptitude curl psmisc locales-all micro vim p7zip-full unzip git openssh-client openssh-server suckless-tools stterm fish tmux xterm fonts-hack fonts-hack-otf fonts-hack-ttf fonts-hack-web fonts-font-awesome x11-utils libreadline-dev libx11-dev libxinerama-dev libxft-dev i3 i3blocks rsstail greetd xorg numlockx xrdp fzf fd-find bat nnn xdg-utils dex tree ripgrep feh btop adwaita-icon-theme locales-all > /dev/null
sudo apt-get -y autoremove > /dev/null

###################
echo '### Greetd Autologin'
sudo sh -c 'echo "[initial_session]"   >> /etc/greetd/config.toml'
sudo sh -c 'echo "command=\"startx\""  >> /etc/greetd/config.toml'
sudo sh -c 'echo "user=\"cedric\""     >> /etc/greetd/config.toml'

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
echo '### Wallpaper'
cd ~
git clone https://github.com/xxxloukxxx/.w

###################
echo '### Some packages'
echo "sudo apt install chromium chromium-l10n pandoc zathura evince okular npm xournalpp texlive-full libreoffice libreoffice-l10n-fr libreoffice-help-fr firefox-esr firefox-esr-l10n-fr btop lftp psmisc gimp gimp-help-fr krita krita-l10n flameshot
