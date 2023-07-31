#!/bin/sh

###################

echo '### Update system'
sudo apt-get -qq update
sudo apt-get -y -qq full-upgrade

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
sudo cp -fr bin/dmenu /usr/bin
sudo cp -fr bin/st /usr/bin

###################

echo '### Reconfigure locales'
sudo dpkg-reconfigure locales
