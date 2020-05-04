Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.define :mongoa do |mongo1|
    mongo1.vm.network :private_network, ip: "192.168.40.100"
    mongo1.vm.synced_folder "config/a", "/home/ubuntu/config"
    mongo1.vm.synced_folder "replica", "/home/vagrant/replica"
    mongo1.vm.provision "shell", path: "environment/mongoa.sh"
  end

  config.vm.define :mongob do |mongo2|
    mongo2.vm.network :private_network, ip: "192.168.40.130"
    mongo2.vm.synced_folder "config/b", "/home/ubuntu/config"
    mongo2.vm.provision "shell", path: "environment/provision.sh"
  end

  config.vm.define :mongoc do |mongo3|
    mongo3.vm.network :private_network, ip: "192.168.40.160"
    mongo3.vm.synced_folder "config/c", "/home/ubuntu/config"
    mongo3.vm.provision "shell", path: "environment/provision.sh"
  end
end
