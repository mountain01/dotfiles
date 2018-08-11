#!/bin/bash

# Environment variables you need to set so you don't have to edit the script below
export DOCKER_CHANNEL=stable
export DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
echo Update the apt package index
sudo apt-get update

echo Install packages to allow apt to use a repository over HTTPS
sudo apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	software-properties-common

echo "Add Docker's official GPG key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo Verify the fingerprint
sudo apt-key fingerprint 0EBFCD88

echo Pick the relase channel
sudo add-apt-repository \
	"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) \
	${DOCKER_CHANNEL}"

echo Update the apt package index
sudo apt-get update

echo Install the latest version of Docker CE
sudo apt-get install -y docker-ce

echo Allow your user to access the Docker CLI without needing root
sudo usermod -aG docker $USER

echo Install Docker Compose
sudo curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose

echo Add docker host to bashrc
echo "export DOCKER_HOST=tcp://0.0.0.0:2375" >> ~/.bashrc && source ~/.bashrc

# Add wsl configuration
# touch /etc/wsl.conf && echo "[automount]\nroot = /\noptions = \"metadata\"" >> /etc/wsl.conf
