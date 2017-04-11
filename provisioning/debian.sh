#!/usr/bin/env bash

sudo apt-get -qq update
sudo apt-get -y install git libyaml-dev libpython2.7-dev libssl-dev python-pip
sudo pip install --upgrade pip
sudo pip install -Iv ansible==2.2.1.0
git clone https://github.com/Like-all/dotfiles.git
/home/vagrant/dotfiles/deploy-dotfiles
