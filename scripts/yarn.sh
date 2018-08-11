#!/bin/bash

echo adding yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

echo isntalling yarn
sudo apt-get update
sudo apt-get install --no-install-recommends yarn
