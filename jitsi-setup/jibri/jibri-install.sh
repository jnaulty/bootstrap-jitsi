#!/bin/bash

# Install necessary packages
apt install -y linux-image-extra-virtual \
    ffmpeg \
    openjdk-8-jdk \
    openjdk-8-jre

# Alsamixer module
echo "snd-aloop" >> /etc/modules

modprobe snd-aloop

if [ $? -ne 0 ]; then
    echo "snd-aloop failed to load in kernel"
    echo "this probably means the current running kernel and the latest kernel installed do not match"
    echo "update the grub config to select the correct kernel"
    echo "then feel free to re-run this script"
fi


# Chrome stuff
curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
apt-get -y update
apt-get -y install google-chrome-stable


mkdir -p /etc/opt/chrome/policies/managed
echo '{ "CommandLineFlagSecurityWarningsEnabled": false }' >>/etc/opt/chrome/policies/managed/managed_policies.json


CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`
wget -N http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip -P ~/
unzip ~/chromedriver_linux64.zip -d ~/
rm ~/chromedriver_linux64.zip
sudo mv -f ~/chromedriver /usr/local/bin/chromedriver
sudo chown root:root /usr/local/bin/chromedriver
sudo chmod 0755 /usr/local/bin/chromedriver

# Jibri requires java-8
update-alternatives --config java
update-alternatives --config javac



