#!/usr/bin/env python

import sys
from fabric.api import run

def setup_server():
  # Install the base software, including node.js and nginx.
  
  run("""
    sudo apt-get install build-essential git monit;
    sudo add-apt-repository ppa:nginx/stable;
    sudo apt-get update;
    sudo apt-get install nginx;
    
    useradd -m web;
    usermod -aG sudo web;
    echo "%sudo ALL=NOPASSWD:/usr/bin/monit" >> /etc/sudoers;
    passwd web;
    su web;
    echo `whoami`;
    
    chsh;
    mkdir ~/src;
    cd ~/src;
    git clone git://github.com/joyent/node.git;
    cd node;
    git checkout v0.10.15;
    ./configure && make && sudo make install;
  """);
  
  app_name = sys.argv[1]
  print app_name
  