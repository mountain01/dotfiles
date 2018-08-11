#!/bin/bash

echo add zsh-nvm
git clone https://github.com/lukechilds/zsh-nvm.git ~/.oh-my-zsh/custom/plugins/zsh-nvm

echo add zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

echo add zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

echo adding git-extras
sudo apt-get install git-extras
