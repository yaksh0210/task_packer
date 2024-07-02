#!/bin/bash

sudo apt update
sudo apt install -y python3

sudo yum remove awscli
sudo apt update
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscli-exe-linux-x86_64.zip"
unzip awscli-exe-linux-x86_64.zip
sudo ./awscli-exe-linux-x86_64/aws/install

sudo apt update
sudo apt install -y openjdk-17-jdk