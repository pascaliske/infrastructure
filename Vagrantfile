# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    # image
    config.vm.box = "debian/buster64"

    # check for update
    config.vm.box_check_update = false

    # configure vm
    config.vm.provider :virtualbox do |vb|
        vb.cpus = 2
        vb.memory = 2048
        vb.gui = false

        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end

    # provision
    config.vm.provision "file", source: "~/.ssh/id_network.pub", destination: "~/.ssh/id_network.pub"
    config.vm.provision "shell", inline: <<-SHELL
        apt-get update
        apt-get install -y vim
        cat /home/vagrant/.ssh/id_network.pub >> /home/vagrant/.ssh/authorized_keys
    SHELL
end
