#!/bin/bash

apt update -y
apt upgrade -y

echo 'deb https://download.jitsi.org stable/' >> /etc/apt/sources.list.d/jitsi-stable.list
wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | apt-key add -y -
apt update -y

cat << EOF >> /etc/systemd/system.conf
DefaultLimitNOFILE=65000
DefaultLimitNPROC=65000
DefaultTasksMax=65000
EOF

systemctl daemon-reload

apt install -y jitsi-meet

/usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh
