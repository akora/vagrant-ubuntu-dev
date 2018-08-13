#!/usr/bin/env bash

apt-get update
apt-get install -y vim htop
apt-get install -y ruby-full
apt-get upgrade python3
apt-get install -y build-essential curl
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
apt-get install -y nodejs
apt-get clean

TARGET_DIR=/home/vagrant/shared
HOSTNAME=$(hostname -f)
OS_RELEASE=$(lsb_release -sd)
IP_ADDRESS=$(/sbin/ifconfig enp0s8 | grep "inet " | awk '{print $2}')

echo $OS_RELEASE '-' $IP_ADDRESS > $TARGET_DIR/$HOSTNAME-$IP_ADDRESS.txt

echo '************************ Basic SysInfo ************************'

df -h /

/home/vagrant/shared/version-checks.sh

exit 0
