sudo apt-get update -y
sudo apt-get upgrade -y

wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org

tee -a "/etc/hosts" <<-"EOF"
192.168.40.100 mongoa
192.168.40.130 mongob
192.168.40.160 mongoc
EOF

sudo ufw enable
sudo ufw allow ssh
sudo ufw allow 27017/tcp

sudo rm /etc/mongod.conf
sudo cp /home/ubuntu/config/mongod.conf /etc/mongod.conf
sudo systemctl start mongod.service
sudo systemctl enable mongod.service
sudo sleep 5
mongo /home/vagrant/replica/primary.js
