#!/bin/bash

sudo apt update

sudo apt install -y curl maven zip
sudo apt-get install -y jq

curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -

sudo apt-get install -y nodejs

