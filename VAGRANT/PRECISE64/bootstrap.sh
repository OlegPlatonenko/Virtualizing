#!/usr/bin/env bash

sudo apt-get update
sudo do-release-upgrade -d
sudo apt-get install -y apache2
if ! [ -L /var/www ]; then
	rm -rf /var/www
	ln -fs /vagrant /var/www
fi
