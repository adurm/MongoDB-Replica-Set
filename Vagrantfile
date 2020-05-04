Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.define :mongoa do |mongoa|
    mongoa.vm.network :private_network, ip: "192.168.40.100"
    mongoa.vm.provision "shell", inline:
  end

  config.vm.define :mongob do |mongob|
    mongoa.vm.network :private_network, ip: "192.168.40.130"
    mongoa.vm.provision "shell", inline:
  end

  config.vm.define :mongoc do |mongoc|
    mongoa.vm.network :private_network, ip: "192.168.40.160"
    mongoa.vm.provision "shell", inline:
  end
end
