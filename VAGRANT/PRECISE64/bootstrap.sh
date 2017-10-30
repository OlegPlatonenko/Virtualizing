#!/usr/bin/env bash

sudo apt-get update
#sudo apt-get -y dist-upgrade
yes | sudo do-release-upgrade
sudo apt-get install -y apache2
if ! [ -L /var/www ]; then
	rm -rf /var/www
	ln -fs /vagrant /var/www
fi
