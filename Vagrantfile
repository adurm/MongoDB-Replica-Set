Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.synced_folder "config", "/home/ubuntu/config"
  config.vm.provision "shell", path: "environment/provision.sh"

  config.vm.define :mongoa do |mongo1|
    mongo1.vm.network :private_network, ip: "192.168.40.100"
    mongo1.vm.synced_folder "replica", "/home/ubuntu/replica"
  end

  config.vm.define :mongob do |mongo2|
    mongo2.vm.network :private_network, ip: "192.168.40.130"
  end

  config.vm.define :mongoc do |mongo3|
    mongo3.vm.network :private_network, ip: "192.168.40.160"
  end
end
