#!/usr/bin/env python

from fabric.api import run
from fabric.operations import sudo

def setup_server(user_name="app", app_name="app"): 
  run("""
    sudo apt-get -y install build-essential git monit;
    sudo add-apt-repository ppa:nginx/stable;
    sudo apt-get update;
    sudo apt-get -y install nginx;
  """);
  
  run("useradd -m %s" % user_name);
  run("usermod -aG sudo %s" % user_name);
  run('echo "%sudo ALL=NOPASSWD:/usr/bin/monit" >> /etc/sudoers');
  run("passwd %s" % user_name);
  
  sudo("""
    chsh -s /bin/bash;
    mkdir ~/src;
    cd ~/src;
    git clone https://github.com/joyent/node.git || exit;
    cd node;
    pwd;
    git checkout v0.10.15;
    ./configure && make && sudo make install;
  """, user_name);
