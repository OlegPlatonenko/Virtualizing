#!/bin/bash

#Import key
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

#Import repository
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

#Update repository cache
yum check-update

#Install vscode
sudo yum install code