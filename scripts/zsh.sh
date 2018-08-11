#!/bin/bash

echo Update apt-get
sudo apt-get update

echo install zsh
sudo apt-get install -y zsh

echo install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
