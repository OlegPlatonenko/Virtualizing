#!/usr/bin/env bash

sudo apt-get update
sudo apt-get upgrade
sudo do-release-upgrade -d

curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | sudo tee /etc/apt/sources.list.d/microsoft.list

sudo apt-get update
sudo apt-get install -y powershell


