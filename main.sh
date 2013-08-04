#!/bin/bash

function show_help() {
  echo "hocus-pocus: set up a node.js + nginx server with ease.";
  echo "";
  echo "Usage: hocus-pocus -s \$SERVER [opts...]";
  echo "  -s: server IP address or domain name (required";
  echo "  -n: app name";
  echo "  -u: user name";
}

while getopts "h?s:n:u:" opt; do
  case "$opt" in
    h|\?)
      show_help
      exit 0
      ;;
    s)
        export SERVER=$OPTARG
        ;;
    n)  export APP_NAME=$OPTARG
      ;;
    u)  export USER_NAME=$OPTARG
      ;;
   esac
done

ssh -T root@$SERVER >>\EOI
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
EOI
