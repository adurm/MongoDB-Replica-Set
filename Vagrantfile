$script = <<-SCRIPT
  sudo apt-get update -y
  sudo apt-get upgrade -y
  wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
  echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
  sudo apt-get update
  sudo apt-get install -y mongodb-org
  tee -a "/etc/hosts" <<-EOF
  192.16.40.100 mongoa
  192.16.40.130 mongob
  192.16.40.160 mongoc
  EOF
  sudo rm /etc/mongod.conf
  sudo cp /home/ubuntu/config/mongod.conf /etc/mongod.conf
  sudo systemctl start mongod.service
  sudo systemctl enable mongod.service
  sudo sleep 5
  mongo /home/vagrant/replica/primary.js
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.synced_folder "config", "/home/ubuntu/config"

  config.vm.define :mongoa do |mongo1|
    mongo1.vm.network :private_network, ip: "192.168.40.100"
    mongo1.vm.synced_folder "replica", "/home/vagrant/replica"
    mongo1.vm.provision "shell", inline: $script
  end

  config.vm.define :mongob do |mongo2|
    mongo2.vm.network :private_network, ip: "192.168.40.130"
    mongo2.vm.provision "shell", path: "environment/provision.sh"
  end

  config.vm.define :mongoc do |mongo3|
    mongo3.vm.network :private_network, ip: "192.168.40.160"
    mongo3.vm.provision "shell", path: "environment/provision.sh"
  end
end
