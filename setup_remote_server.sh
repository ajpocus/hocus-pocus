#!/bin/bash

sudo apt-get -y install build-essential git monit;
sudo add-apt-repository ppa:nginx/stable;
sudo apt-get update;
sudo apt-get -y install nginx;

useradd -m web;
usermod -aG sudo web;
echo "%sudo ALL=NOPASSWD:/usr/bin/monit" >> /etc/sudoers;
passwd web;
su web;
echo `whoami`;

chsh -s /bin/bash;
mkdir ~/src;
cd ~/src;
git clone git://github.com/joyent/node.git;
cd node;
git checkout v0.10.15;
./configure && make && sudo make install;
