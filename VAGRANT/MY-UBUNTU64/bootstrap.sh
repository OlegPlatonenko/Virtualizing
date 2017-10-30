#!/usr/bin/env bash

#sudo apt-get update
#yes | sudo do-release-upgrade

apt-get update
apt-get upgrade -y
yes | do-release-upgrade