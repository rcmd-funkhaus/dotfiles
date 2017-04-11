#!/usr/bin/env bash

sudo apt-get -qq update
sudo apt-get install git pip
sudo pip install -Iv ansible==2.2.1.0
git clone https://github.com/Like-all/dotfiles.git
