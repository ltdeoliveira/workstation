#!/bin/bash

sudo apt update && sudo apt install -y \
	python3 python3-dev python3-pip \
	git zsh make \
	curl terminator \
	apt-transport-https

# aws cli
sudo python3 -m pip install awscli

# aws iam authenticator
curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/darwin/amd64/aws-iam-authenticator
sudo mv aws-iam-authenticator /usr/local/bin
sudo chmod +x /usr/local/bin/aws-iam-authenticator

# docker
wget -qO- https://get.docker.com/ | sudo sh
sudo usermod -aG docker $(whoami)

# golang
wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz 
sudo  tar -C /usr/local -xzf go1.13.4.linux-amd64.tar.gz
echo -e "\n export PATH=$PATH:/usr/local/go/bin \n" >> ~/.zshrc
echo -e "\n export PATH=$PATH:/usr/local/go/bin \n" >> ~/.bashrc

# chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# vs code
wget https://go.microsoft.com/fwlink/\?LinkID\=760868 -O code.deb
sudo dpkg -i code.deb

# zsh
curl -Lo install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
sh install.sh

# terraform
TF_VERSION=0.11.14
wget https://releases.hashicorp.com/terraform/"$TF_VERSION"/terraform_"$TF_VERSION"_linux_amd64.zip -O /tmp/terraform.zip ; 
sudo unzip -d /usr/local/bin /tmp/terraform.zip 

# terraform-docs
sudo wget https://github.com/segmentio/terraform-docs/releases/download/v0.6.0/terraform-docs-v0.6.0-linux-amd64 -O /usr/local/bin/terraform-docs 
sudo chmod +x /usr/local/bin/terraform-docs 

# terragrunt
wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.21.5/terragrunt_linux_amd64
sudo mv terragrunt_linux_amd64 /usr/local/bin/terragrunt
sudo chmod +x /usr/local/bin/terragrunt

# set keyboard to br
echo -e "\n setxkbmap br \n" >> ~/.bashrc
echo -e "\n setxkbmap br \n" >> ~/.zshrc