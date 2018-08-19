#!/bin/bash

# Note: The script requires Ubuntu 16.04

# Update OpenSSH client and server
sudo apt-get update
sudo apt-get remove openssh-client openssh-server
sudo apt-get install openssh-client openssh-server

# Install Git
sudo apt-get install git
git config --global http.sslverify false

# Install Docker
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce
sudo docker run hello-world

# Make Docker runnable without sudo
sudo groupadd docker
sudo gpasswd -a $USER docker
docker run hello-world

# Install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Install Java 8
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
sudo apt-get install oracle-java8-set-default
java -version

# Install Java 10
sudo add-apt-repository ppa:linuxuprising/java
sudo apt-get update
sudo apt-get install oracle-java10-installer
sudo apt-get install oracle-java10-set-default
java -version

# Install CIFS and mount shared directory
sudo apt-get install cifs-utils
sudo mount -t cifs //cloudfirst-qa/demarcation /home/cloudfirst/demarcation/ -o user=diva,pass=diva,uid=cloudfirst,gid=cloudfirst

