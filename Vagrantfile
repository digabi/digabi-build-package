# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "vagrantbox-debian-jessie-amd64"
  config.vm.box_url = "http://ci.local/job/vagrant-baseboxen-multiarch/BITS=64/lastSuccessfulBuild/artifact/metadata.json"
  # config.vm.box_check_update = false
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder "./tools", "/tools", type: "rsync"
  config.vm.synced_folder "./dist", "/dist", create: true

  config.vm.provision "shell", inline: <<-SHELL
    export DEBIAN_FRONTEND=noninteractive
    sudo dpkg --add-architecture i386
    sudo apt-get update
    sudo apt-get -qy dist-upgrade
    sudo apt-get -qy install build-essential packaging-dev devscripts lintian dpatch quilt fakeroot equivs git rsync
    sudo sed -i -e 's/#\(precedence ::ffff:.*100\)/\1/' /etc/gai.conf
    sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
  SHELL
end
