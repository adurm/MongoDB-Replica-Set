#!/bin/bash

# Update the sources list
sudo apt-get update -y

# upgrade any packages available
sudo apt-get upgrade -y

# install mongodb
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf

# set up configs for replica set
MONGOD_CONF_FILE="/etc/mongod.conf"
tee -a $MONGOD_CONF_FILE <<-EOF
smallfiles = true
oplogSize = 64
replSet = bogus-replica-set
EOF
iptables -I INPUT -p tcp -m state --state NEW -m tcp --dport 27017 -j ACCEPT
iptables-save > /etc/sysconfig/iptables
sudo systemctl reload-or-restart iptables
sudo systemctl start mongod.service
sudo systemctl enable mongod.service
