#!/usr/bin/env bash

set -x 

# Update packages
sudo apt-get update

# Install git
sudo apt-get install -y git

# Install Docker
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo usermod -aG docker $USER  # Add the current user to the docker group

# Install AWS CLI
sudo apt-get install -y awscli

# Install Amazon SSM
sudo snap install amazon-ssm-agent --classic
sudo systemctl start snap.amazon-ssm-agent.amazon-ssm-agent.service

# Install CloudWatch Agent
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i amazon-cloudwatch-agent.deb
sudo systemctl start amazon-cloudwatch-agent

# Install AWS Inspector
curl -O https://inspector-agent.amazonaws.com/linux/latest/install
sudo bash install
