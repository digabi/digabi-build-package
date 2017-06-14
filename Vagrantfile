# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.provider "virtualbox"
  config.vm.box = "debian/jessie64"
  # config.vm.box_check_update = false
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder "./tools", "/tools"
  config.vm.synced_folder "./dist", "/dist", create: true

  config.vm.provision "shell", inline: <<-SHELL
    export DEBIAN_FRONTEND=noninteractive
    sudo dpkg --add-architecture i386
    sudo apt-get update
    sudo apt-get -qy dist-upgrade
    sudo apt-get -qy install build-essential packaging-dev devscripts lintian dpatch quilt fakeroot equivs git rsync
  SHELL
end
