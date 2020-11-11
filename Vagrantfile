# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    # image
    config.vm.box = "debian/buster64"

    # check for update
    config.vm.box_check_update = false

    # provision
    config.vm.provision "file", source: "~/.ssh/id_network.pub", destination: "~/.ssh/id_network.pub"
    config.vm.provision "shell", inline: <<-SHELL
        apt-get update
        apt-get install -y vim
        cat /home/vagrant/.ssh/id_network.pub >> /home/vagrant/.ssh/authorized_keys
    SHELL
end
