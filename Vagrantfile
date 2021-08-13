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
    config.vm.provision "file", source: "#{ENV["ANSIBLE_PRIVATE_KEY_FILE"]}.pub", destination: "/home/vagrant/.ssh/id_vagrant.pub"
    config.vm.provision "shell", inline: <<-SHELL
        cat /home/vagrant/.ssh/id_vagrant.pub >> /home/vagrant/.ssh/authorized_keys
    SHELL
end
