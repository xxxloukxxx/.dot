#!/bin/sh

###################

echo '### Update system'
sudo apt-get -qq update
sudo apt-get -y -qq full-upgrade
sudo apt-get -y -qq install sudo build-essential software-properties-common apt-transport-https aptitude curl psmisc locales-all micro vim p7zip-full unzip git openssh-client openssh-server suckless-tools stterm fish tmux xterm fonts-hack fonts-hack-otf fonts-hack-ttf fonts-hack-web fonts-font-awesome x11-utils libreadline-dev libx11-dev libxinerama-dev libxft-dev i3 i3blocks rsstail greetd xorg numlockx xrdp fzf fd-find bat nnn xdg-utils dex tree ripgrep feh btop adwaita-icon-theme

###################

echo '### cp dotfiles'
cp -fr .config ~/
cp -fr .vimrc ~/
cp -fr .Xresources ~/
/usr/bin/xrdb .Xresources

###################
# echo '### greetd autologin'
# sudo sh -c 'echo "[terminal]"          >  /etc/greetd/config.toml'
# sudo sh -c 'echo "vt = 7"              >> /etc/greetd/config.toml'
# sudo sh -c 'echo "[default_session]"   >> /etc/greetd/config.toml'
# sudo sh -c 'echo "command=\"startx\""  >> /etc/greetd/config.toml'
# sudo sh -c 'echo "user=\"cedric\""     >> /etc/greetd/config.toml'
# sudo sh -c 'echo "[initial_session]"   >> /etc/greetd/config.toml'
# sudo sh -c 'echo "command=\"startx\""  >> /etc/greetd/config.toml'
# sudo sh -c 'echo "user=\"cedric\""     >> /etc/greetd/config.toml'

###################

echo '### Sudo no passwd'
sudo sh -c 'echo cedric ALL=\(ALL:ALL\) NOPASSWD:ALL > /etc/sudoers.d/moi'

###################

echo '### Change shell to fish'
chsh -s /usr/bin/fish

###################

echo '### Install st & dmenu'
cd src
cd st
sudo make clean install
make clean
cd ..
cd dmenu
sudo make clean install
make clean
cd ..
cd ..

###################

echo '### Reconfigure locales'
sudo dpkg-reconfigure locales
