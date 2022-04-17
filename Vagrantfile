# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # enforce vagrant to don't run auto detection, it will fail
  config.vm.guest = "linux"
  config.vm.box = "openwrt"
  config.vm.boot_timeout = 60

  # bash isn't installed by default
  config.ssh.shell = "/bin/ash"

  # there are no virtualbox guest additions, so shared folder not working
  config.vm.synced_folder './', '/vagrant', disabled: true

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "256"
  end

  config.vm.provider "libvirt" do |lv|
    lv.memory = "256"
  end
end
